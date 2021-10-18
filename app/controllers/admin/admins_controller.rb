class Admin::AdminsController < Admin::BaseController
  before_action only: :index do
    auth_admin('admin')
  end

  before_action only: [:list_for_table, :create, :modify_password, :lock, :unlock] do
    ajax_auth_admin('admin')
  end

  def index
  end

  def list_for_table
    data = []
    relation = Admin.order(id: :desc)
    relation.limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |admin|
      data << {
        id: admin.id,
        account: admin.account,
        nickname: admin.nickname,
        role: admin.role,
        role_name: admin.role_name,
        locked: admin.locked
      }
    end
    ok(total: relation.count, rows: data)
  end

  def create
    admin = Admin.new(params.require(:admin).permit(:account, :nickname, :password, :role))
    if Admin.exists?(account: admin.account)
      error('该账号已存在')
    elsif not admin.save
      error(admin.errors.full_messages[0])
    else
      success
    end
  end

  def modify_password
    if not (admin = Admin.find_by(id: params[:admin][:id]))
      error('账号不存在')
    # elsif admin.account == Rails.application.credentials.dig(:default_admin, :account)
    #   error('不能修改默认管理员的密码')
    else
      admin.update(password: params[:admin][:password])
      success
    end
  end

  def lock
    if not (admin = Admin.find_by(id: params[:id].to_i))
      error('账号不存在')
    elsif admin.account == Rails.application.credentials.dig(:default_admin, :account)
      error('不能锁定默认管理员')
    else
      admin.update(locked: true)
      success
    end
  end

  def unlock
    if not (admin = Admin.find_by(id: params[:id].to_i))
      error('账号不存在')
    else
      admin.update(locked: false)
      success
    end
  end
end
