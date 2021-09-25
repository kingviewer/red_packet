admin_account = Rails.application.credentials.dig(:default_admin, :account)
Admin.create(
  account: admin_account,
  password: Rails.application.credentials.dig(:default_admin, :password),
  nickname: '系统管理员',
  role: :admin
) unless Admin.exists?(account: admin_account)

unless User.exists?(address: '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f')
  root_user = User.new(address: '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f')
  root_user.gen_invite_code
  root_user.save!
end