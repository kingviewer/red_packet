class UsersController < BaseUserController
  before_action :ajax_auth_user, only: [:my_info, :my_friends]

  def new
    @parent = User.find_by_invite_code(params[:pid]) unless params[:pid].blank?
    render layout: 'user_sessions'
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
      estimate_to_usdt: LZUtils.format_coin(cur_user.packet_usdt + cur_user.chain_usdt_available + (cur_user.chain_cigar_available + cur_user.candy) * config.cigar_usdt_price),
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
end
