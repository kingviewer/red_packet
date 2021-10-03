class UsersController < BaseUserController
  before_action :ajax_auth_user, only: [:my_info]

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
        user.user_session.renew
        cookies[:user_token] = user.user_session.token
        success(user_token: user.user_session.token)
      end
    end
  end

  def my_info
    success(
      invite_code: cur_user.invite_code,
      address: cur_user.encrypted_address,
      role: cur_user.role,
      chain_usdt_available: cur_user.chain_usdt_available,
      packet_usdt_available: cur_user.packet_usdt_available,
      packet_usdt_available_display: LZUtils.format_coin(cur_user.packet_usdt_available),
      packet_usdt_frozen: cur_user.packet_usdt_frozen,
      packet_usdt_frozen_display: LZUtils.format_coin(cur_user.packet_usdt_frozen),
      packet_usdt: cur_user.packet_usdt,
      packet_usdt_display: LZUtils.format_coin(cur_user.packet_usdt),
      candy_available: cur_user.candy_available,
      candy_available_display: LZUtils.format_coin(cur_user.candy_available),
      candy_frozen: cur_user.candy_frozen,
      candy_frozen_display: LZUtils.format_coin(cur_user.candy_frozen),
      team_usdt_flow: cur_user.team_usdt_flow,
      team_usdt_flow_display: LZUtils.format_coin(cur_user.team_usdt_flow),
      invite_url: "#{Utils::Constants::BASE_URL}users/new?pid=#{cur_user.invite_code}"
    )
  end
end
