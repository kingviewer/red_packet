GlobalConfig.create unless GlobalConfig.exists?

SysAccount.create(account_type: :back_fund) unless SysAccount.back_fund.exists?
SysAccount.create(account_type: :token_fund) unless SysAccount.token_fund.exists?
SysAccount.create(account_type: :income) unless SysAccount.income.exists?
SysAccount.create(account_type: :vip_usdt) unless SysAccount.vip_usdt.exists?
SysAccount.create(account_type: :vip_cic) unless SysAccount.vip_cic.exists?
SysAccount.create(account_type: :agent_usdt) unless SysAccount.agent_usdt.exists?
SysAccount.create(account_type: :agent_cic) unless SysAccount.agent_cic.exists?

admin_account = Rails.application.credentials.dig(:default_admin, :account)
Admin.create(
  account: admin_account,
  password: Rails.application.credentials.dig(:default_admin, :password),
  nickname: '系统管理员',
  role: :admin
) unless Admin.exists?(account: admin_account)

unless User.exists?(address: '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f'.downcase)
  root_user = User.new(address: '0x9aA2e22c8F117a540CA1c008E12e84f6A2CD349f'.downcase)
  root_user.gen_invite_code
  root_user.save!
end

Game.create(usdt_amount: 10, player_amount: 5, loser_amount: 2) unless Game.exists?(usdt_amount: 10)
Game.create(usdt_amount: 20, player_amount: 6, loser_amount: 2) unless Game.exists?(usdt_amount: 20)
Game.create(usdt_amount: 50, player_amount: 10, loser_amount: 4) unless Game.exists?(usdt_amount: 50)