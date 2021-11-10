class BaseUserController < ApplicationController
  def cur_user
    @cur_user || (
      if (user_token = params[:user_token] || cookies[:user_token])
        (@cur_user = User.find_by_address(user_token))
      end
    )
  end

  def auth_user
    if cur_user.nil? || cur_user.locked?
      redirect_to '/user_sessions/new'
      false
    else
      true
    end
  end

  def ajax_auth_user
    if cur_user.nil? || cur_user.locked?
      login_to_operate
      false
    else
      true
    end
  end
end
