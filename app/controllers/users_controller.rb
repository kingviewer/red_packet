class UsersController < BaseUserController
  before_action :auth_user, only: [:apply_agent, :apply_vip, :exchange_cic]
  before_action :ajax_auth_user, only: [:my_info, :my_friends, :become_agent, :become_vip, :exchange_info, :exchange]

  def new
    @parent = User.find_by_invite_code(params[:pid]) unless params[:pid].blank?
    render layout: 'user_sessions'
  end

  def exists
    success(exists: User.exists?(address: params[:address]))
  end

  def apply_agent
    @title = t('dashboard.index.apply_agent')
    @global_config = GlobalConfig.first
    render layout: 'user'
  end

  def apply_vip
    @title = t('dashboard.index.apply_vip')
    @global_config = GlobalConfig.first
    render layout: 'user'
  end

  def choose_lang
    @title = t('dashboard.index.language')
    render layout: 'user'
  end

  def exchange_cic
    @title = t('dashboard.index.exchange_cic')
    render layout: 'user'
  end

  def create
    if not (parent = User.find_by_invite_code(params[:user][:invite_code]))
      error(t('.create.parent_not_exist'))
    else
      user = User.new(params.require(:user).permit(:address))
      user.address = user.address.downcase
      if User.exists?(address: user.address)
        error(t('.address_already_exists'))
      else
        user.parent_id = parent.id
        begin
          user.gen_invite_code
          user.save
        rescue
          retry
        end
        cookies[:user_token] = user.address
        success(user_token: user.address)
      end
    end
  end

  def my_info
    config = GlobalConfig.first
    success(
      invite_code: cur_user.invite_code,
      address: cur_user.encrypted_address,
      role: cur_user.role,
      role_name: cur_user.role_name,
      chain_usdt: cur_user.chain_usdt_available,
      chain_usdt_display: LZUtils.format_coin(cur_user.chain_usdt_available),
      packet_usdt_available: cur_user.packet_usdt_available,
      packet_usdt_available_display: LZUtils.format_coin(cur_user.packet_usdt_available),
      packet_usdt_frozen: cur_user.packet_usdt_frozen,
      packet_usdt_frozen_display: LZUtils.format_coin(cur_user.packet_usdt_frozen),
      packet_usdt: cur_user.packet_usdt,
      packet_usdt_display: LZUtils.format_coin(cur_user.packet_usdt),
      chain_cigar: cur_user.chain_cigar_available,
      chain_cigar_display: LZUtils.format_coin(cur_user.chain_cigar_available),
      candy_available: cur_user.candy_available,
      candy_available_display: LZUtils.format_coin(cur_user.candy_available),
      candy_frozen: cur_user.candy_frozen,
      candy_frozen_display: LZUtils.format_coin(cur_user.candy_frozen),
      candy: cur_user.candy,
      candy_display: LZUtils.format_coin(cur_user.candy),
      cigar_usdt_price: config.cigar_usdt_price,
      estimate_to_usdt: cur_user.packet_usdt + cur_user.chain_usdt_available + (cur_user.chain_cigar_available + cur_user.candy) * config.cigar_usdt_price,
      team_usdt_flow: cur_user.team_usdt_flow,
      team_usdt_flow_display: LZUtils.format_coin(cur_user.team_usdt_flow),
      invite_url: "#{Utils::Constants::BASE_URL}users/new?pid=#{cur_user.invite_code}",
      friends: cur_user.team_user_amount
    )
  end

  def my_friends
    data = []
    cur_user.children.order(id: :desc).limit(params[:limit].to_i).offset(params[:page].to_i * params[:limit].to_i).each do |child|
      data << {
        id: child.id,
        invite_code: child.invite_code,
        address: child.encrypted_address,
        role_name: child.role_name,
        friends: child.team_user_amount,
        created_at: child.formatted_created_at
      }
    end
    success(data)
  end

  def become_agent
    global_config = GlobalConfig.first
    cur_user.with_lock do
      if cur_user.agent?
        error(t('.already_agent'))
      else
        if params[:asset_type] == 'usdt'
          if cur_user.packet_usdt_available < global_config.agent_price
            error(t('dashboard.index.balance_insufficient'))
          else
            cigar_amount = ((global_config.agent_price * 0.2) / global_config.cigar_usdt_price).floor(6)
            cur_user.packet_usdt_available -= global_config.agent_price
            cur_user.candy_available += cigar_amount
            cur_user.role = :agent
            cur_user.save
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :usdt,
              account_type: :packet,
              flow_type: :buy_agent,
              amount: -global_config.agent_price
            )
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :cigar,
              account_type: :packet,
              flow_type: :agent_init_reward,
              amount: cigar_amount
            )
            sys_income = global_config.agent_price - cur_user.reward_new_buy(global_config.vip_price, global_config.agent_price, :usdt, :team_new_agent)
            SysAccount.agent_usdt.update_all(['balance = balance + ?, total = total + ?', sys_income, sys_income])
            SysFlow.create(
              sys_account_id: SysAccount.agent_usdt.first.id,
              flow_type: :new_agent,
              amount: sys_income
            )
            success
          end
        else
          cic_price = (global_config.agent_price * 0.5 / global_config.cigar_usdt_price).ceil(6)
          if cur_user.candy_available < cic_price
            error(t('dashboard.index.balance_insufficient'))
          else
            # cigar_amount = (cic_price * 0.2).floor(6)
            cur_user.candy_available -= cic_price
            # cur_user.candy_available += cigar_amount
            cur_user.role = :agent
            cur_user.save
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :cigar,
              account_type: :packet,
              flow_type: :buy_agent,
              amount: -cic_price
            )
            # AssetFlow.create(
            #   user_id: cur_user.id,
            #   asset_type: :cigar,
            #   account_type: :packet,
            #   flow_type: :agent_init_reward,
            #   amount: cigar_amount
            # )
            reward_usdt = cur_user.reward_new_buy(
              (global_config.vip_price * 0.5).ceil(6), (global_config.agent_price * 0.5).ceil(6), :usdt,
              :team_new_agent
            )
            SysAccount.agent_usdt.update_all(['balance = balance - ?, total = total - ?', reward_usdt, reward_usdt])
            SysAccount.agent_cic.update_all(['balance = balance + ?, total = total + ?', cic_price, cic_price])
            SysFlow.create(
              sys_account_id: SysAccount.agent_usdt.first.id,
              flow_type: :new_agent,
              amount: -reward_usdt
            )
            SysFlow.create(
              sys_account_id: SysAccount.agent_cic.first.id,
              flow_type: :new_agent,
              amount: cic_price
            )
            success
          end
        end
      end
    end
  end

  def become_vip
    global_config = GlobalConfig.first
    cur_user.with_lock do
      if cur_user.vip?
        error(t('.already_vip'))
      elsif cur_user.agent?
        error(t('.already_agent'))
      else
        if params[:asset_type] == 'usdt'
          if cur_user.packet_usdt_available < global_config.vip_price
            error(t('dashboard.index.balance_insufficient'))
          else
            cigar_amount = ((global_config.vip_price * 0.2) / global_config.cigar_usdt_price).floor(6)
            cur_user.packet_usdt_available -= global_config.vip_price
            cur_user.candy_available += cigar_amount
            cur_user.role = :vip
            cur_user.save
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :usdt,
              account_type: :packet,
              flow_type: :buy_vip,
              amount: -global_config.vip_price
            )
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :cigar,
              account_type: :packet,
              flow_type: :vip_init_reward,
              amount: cigar_amount
            )
            sys_income = global_config.vip_price - cur_user.reward_new_buy(global_config.vip_price, global_config.vip_price, :usdt, :team_new_vip)
            SysAccount.vip_usdt.update_all(['balance = balance + ?, total = total + ?', sys_income, sys_income])
            SysFlow.create(
              sys_account_id: SysAccount.vip_usdt.first.id,
              flow_type: :new_vip,
              amount: sys_income
            )
            success
          end
        else
          cic_price = global_config.vip_price * 0.5 / global_config.cigar_usdt_price
          if cur_user.candy_available < cic_price
            error(t('dashboard.index.balance_insufficient'))
          else
            # cigar_amount = (cic_price * 0.2).floor(6)
            cur_user.candy_available -= cic_price
            # cur_user.candy_available += cigar_amount
            cur_user.role = :vip
            cur_user.save
            AssetFlow.create(
              user_id: cur_user.id,
              asset_type: :cigar,
              account_type: :packet,
              flow_type: :buy_vip,
              amount: -cic_price
            )
            # AssetFlow.create(
            #   user_id: cur_user.id,
            #   asset_type: :cigar,
            #   account_type: :packet,
            #   flow_type: :vip_init_reward,
            #   amount: cigar_amount
            # )
            reward_usdt = cur_user.reward_new_buy(
              (global_config.vip_price * 0.5).ceil(6), (global_config.vip_price * 0.5).ceil(6),
              :usdt, :team_new_vip)
            SysAccount.vip_cic.update_all(['balance = balance + ?, total = total + ?', cic_price, cic_price])
            SysAccount.vip_usdt.update_all(['balance = balance - ?, total = total - ?', reward_usdt, reward_usdt])
            SysFlow.create(
              sys_account_id: SysAccount.vip_cic.first.id,
              flow_type: :new_vip,
              amount: cic_price
            )
            SysFlow.create(
              sys_account_id: SysAccount.vip_usdt.first.id,
              flow_type: :new_vip,
              amount: -reward_usdt
            )
            success
          end
        end
      end
    end
  end

  def exchange_info
    global_config = GlobalConfig.first
    success(
      cic_usdt_price: global_config.cigar_usdt_price,
      formatted_cic_usdt_price: LZUtils.format_coin(global_config.cigar_usdt_price),
      packet_usdt_available: LZUtils.format_coin(cur_user.packet_usdt_available)
    )
  end

  def exchange
    amount = BigDecimal(params[:cic_amount])
    if amount <= 0
      invalid_params
    elsif AssetFlow.where(user_id: cur_user.id, flow_type: :exchange_cic, asset_type: :cigar).sum(:amount) + amount > 1000
      error(t('.exchange_cic.max_exchange_amount', amount: 1000))
    else
      global_config = GlobalConfig.first
      cost_usdt = (amount * global_config.cigar_usdt_price).ceil(8)
      User.where(id: cur_user.id).update_all(
        ['packet_usdt_available = packet_usdt_available - ?, candy_available = candy_available + ?',
         cost_usdt, amount]
      )
      cur_user.reload
      if cur_user.packet_usdt_available < 0
        User.where(id: cur_user.id).update_all(
          ['packet_usdt_available = packet_usdt_available + ?, candy_available = candy_available - ?',
           cost_usdt, amount]
        )
        error(t('game_rooms.join.usdt_available_insufficient'))
      else
        AssetFlow.create(
          user_id: cur_user.id,
          account_type: :packet,
          asset_type: :usdt,
          flow_type: :exchange_cic,
          amount: -cost_usdt
        )
        AssetFlow.create(
          user_id: cur_user.id,
          account_type: :packet,
          asset_type: :cigar,
          flow_type: :exchange_cic,
          amount: amount
        )
        sys_account_u = SysAccount.exchange_usdt.first
        sys_account_c = SysAccount.exchange_cic.first
        SysAccount.where(id: sys_account_u.id).update_all(['balance = balance + ?, total = total + ?', cost_usdt, cost_usdt])
        SysAccount.where(id: sys_account_c.id).update_all(['balance = balance + ?, total = total + ?', amount, amount])
        SysFlow.create(
          sys_account_id: sys_account_u.id,
          flow_type: :exchange,
          amount: cost_usdt
        )
        SysFlow.create(
          sys_account_id: sys_account_c.id,
          flow_type: :exchange,
          amount: amount
        )
        success(packet_usdt_available: LZUtils.format_coin(cur_user.packet_usdt_available))
      end
    end
  end

end
