class BaseUserController < ApplicationController
  def cur_session
    @cur_session || (
      if (user_token = cookies[:user_token] || params[:user_token])
        (@cur_session = UserSession.find_by(token: user_token))
      end)
  end

  def cur_user
    cur_session&.user
  end

  def auth_user
    if cur_session.nil? || cur_session.user.locked?
      redirect_to '/user_sessions/new'
      false
    else
      true
    end
  end

  def ajax_auth_user
    if cur_session.nil? || cur_session.user.locked?
      login_to_operate
      false
    else
      true
    end
  end
end
