class UserSessionsController < BaseUserController
  layout 'user_sessions', only: :new

  def new
    # cookies[:user_token] = nil
    redirect_to '/'
  end

  def create
    if not (user = User.find_by_address(params[:address]))
      user_not_exist
    else
      cookies[:user_token] = user.address
      success(user_token: user.address)
    end
  end
end
