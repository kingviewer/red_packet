class UsersController < BaseUserController
  before_action :auth_user, only: [:apply_agent, :apply_vip]
  before_action :ajax_auth_user, only: [:my_info, :my_friends, :become_agent, :become_vip]

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
    @title = '语言'
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
      invite_url: "#{Utils::Constants::BASE_URL}users/new?pid=#{cur_user.invite_code}"
    )
  end

  def my_friends
    data = []
    cur_user.children.order(id: :desc).limit(params[:limit].to_i).offset(params[:page].to_i * params[:limit].to_i).each do |child|
      data << {
        id: child.id,
        invite_code: child.invite_code,
        address: child.encrypted_address,
        friends: child.children.count,
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
            cur_user.reward_new_buy(global_config.vip_price, global_config.agent_price, :usdt, :team_new_agent)
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
            cur_user.reward_new_buy(
              (global_config.vip_price * 0.5 / global_config.cigar_usdt_price).ceil(6), cic_price, :cigar,
              :team_new_agent
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
            cur_user.reward_new_buy(global_config.vip_price, global_config.vip_price, :usdt, :team_new_vip)
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
            cur_user.reward_new_buy(cic_price, cic_price, :cigar, :team_new_vip)
            success
          end
        end
      end
    end
  end
end
