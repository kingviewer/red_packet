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