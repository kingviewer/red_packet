class UserSessionsController < BaseUserController
  layout 'user_sessions', only: :new

  def new
    cookies[:user_token] = nil
  end

  def create
    if not (user = User.find_by_address(params[:address]))
      user_not_exist
    else
      user.user_session.renew
      cookies[:user_token] = user.user_session.token
      success(user_token: user.user_session.token)
    end
  end
end
