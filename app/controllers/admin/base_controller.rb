class Admin::BaseController < ApplicationController
  layout 'admin'

  def cur_session
    @cur_session || (
      if (admin_token = cookies[:admin_token] || params[:admin_token])
        (@cur_session = AdminSession.find_by_token(admin_token))
      end)
  end

  def auth_admin(*roles)
    if cur_session.nil? || cur_session.admin.locked? || cur_session.ip_addr != request.remote_ip ||
      roles.length > 0 && !roles.include?(cur_session.admin.role)
      redirect_to '/admin/admin_sessions/new'
      false
    else
      true
    end
  end

  def ajax_auth_admin(*roles)
    if cur_session.nil? || cur_session.admin.locked? || cur_session.ip_addr != request.remote_ip ||
      roles.length > 0 && !roles.include?(cur_session.admin.role)
      login_to_operate
      false
    else
      true
    end
  end

  protected

  def switch_locale(&action)
    I18n.with_locale(:'zh-CN', &action)
  end
end