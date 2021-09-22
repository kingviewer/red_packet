admin_account = Rails.application.credentials.dig(:default_admin, :account)
Admin.create(
  account: admin_account,
  password: Rails.application.credentials.dig(:default_admin, :password),
  nickname: '系统管理员',
  role: :admin
) unless Admin.exists?(account: admin_account)