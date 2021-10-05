class User < ApplicationRecord
  enum role: [:user, :vip, :agent]
  enum state: [:normal, :locked]

  belongs_to :parent, foreign_key: :parent_id, class_name: 'User', required: false
  belongs_to :first_agent, foreign_key: :agent_id, class_name: 'User', required: false
  has_one :user_session
  has_many :children, foreign_key: :parent_id, class_name: 'User'
  has_many :game_room
  has_many :game_waiters
  has_one :user_room

  after_create :gen_session

  # 代理佣金比例
  def agent_commission_rate
    case team_usdt_flow
    when 0...50000
      0.02
    when 50000...1000000
      0.025
    when 1000000...10000000
      0.03
    else
      0.033
    end
  end

  def gen_invite_code
    self.invite_code = LZUtils.gen_rand_str(6).upcase
  end

  def encrypted_address
    _addr = address.clone
    _addr[12..31] = '...'
    _addr
  end

  def packet_usdt
    packet_usdt_available + packet_usdt_frozen
  end

  def candy
    candy_available + candy_frozen
  end

  private

  def gen_session
    UserSession.create(user: self)
  end
end
