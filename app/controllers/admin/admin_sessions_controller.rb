class Admin::AdminSessionsController < ApplicationController
  layout 'login'

  def new
    @admin_session = AdminSession.new
  end

  def create
    admin = Admin.find_by_account(params[:admin_session][:account])
    if admin.nil? || !admin.authenticate(params[:admin_session][:password])
      error('账号不存在或密码错误')
    else
      begin
        admin.admin_session.renew(request.remote_ip)
      rescue
        retry
      end
      cookies[:admin_token] = admin.admin_session.token
      success(admin_token: admin.admin_session.token)
    end
  end

  def destroy
    if (admin_token = cookies[:admin_token] || params[:admin_token])
      if (cur_session = AdminSession.find_by(token: admin_token))
        cur_session.update(token: nil)
      end
    end
    session[:admin_token] = nil
    success
  end
end
