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

  MAX_COMMISSION_RATE = 0.033

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
      MAX_COMMISSION_RATE
    end
  end

  def role_name
    I18n.t("models.user.roles.#{role}")
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

  def add_team_flow(amount)
    User.where(id: id).update(['team_usdt_flow = team_usdt_flow + ?', amount]) if agent?
    parent&.add_team_flow(amount)
  end

  # 用户购买代理，往上奖励
  def reward_buying_role(amount, flow_type, asset_type)
    prev_rate = 0
    same_rewarded = false
    prev_reward_amount = 0
    dst_user = parent
    field_name =
      if asset_type == :usdt
        'packet_usdt_available'
      else
        'candy_available'
      end
    loop do
      if dst_user.agent?
        rate = dst_user.agent_commission_rate
        if rate > prev_rate
          same_rewarded = false
          reward_amount = (amount * (rate - prev_rate)).floor(6)
          User.where(id: dst_user.id).update_all(["#{field_name} = #{field_name} + ?", reward_amount])
          AssetFlow.create(
            user_id: dst_user.id,
            account_type: :packet,
            asset_type: asset_type,
            flow_type: flow_type,
            amount: reward_amount
          )
          prev_rate = rate
          prev_reward_amount = reward_amount
        elsif rate == prev_rate && !same_rewarded
          reward_amount = (prev_reward_amount * 0.1).floor(6)
          User.where(id: dst_user.id).update_all(["#{field_name} = #{field_name} + ?", reward_amount])
          AssetFlow.create(
            user_id: dst_user.id,
            account_type: :packet,
            asset_type: asset_type,
            flow_type: flow_type,
            amount: reward_amount
          )
          break if rate == MAX_COMMISSION_RATE
          same_rewarded = true
        end
      end
      break unless (dst_user = dst_user.parent)
    end
  end

  private

  def gen_session
    UserSession.create(user: self)
  end
end
