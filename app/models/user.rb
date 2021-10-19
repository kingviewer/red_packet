class User < ApplicationRecord
  enum role: [:user, :vip, :agent]
  enum state: [:normal, :locked]

  belongs_to :parent, foreign_key: :parent_id, class_name: 'User', required: false
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

  def state_name
    I18n.t("models.user.states.#{state}")
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
    User.where(id: id).update_all(['team_usdt_flow = team_usdt_flow + ?', amount]) if agent?
    parent&.add_team_flow(amount)
  end

  # 红包流水，代理往上奖励
  def reward_flow(amount)
    prev_rate = 0
    same_rewarded = false
    prev_reward_amount = 0
    dst_user = parent
    field_name = 'packet_usdt_available'
    total_reward = 0
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
            asset_type: :usdt,
            flow_type: :agent_reward,
            amount: reward_amount
          )
          total_reward += reward_amount
          prev_rate = rate
          prev_reward_amount = reward_amount
        elsif rate == prev_rate && !same_rewarded
          reward_amount = (prev_reward_amount * 0.1).floor(6)
          User.where(id: dst_user.id).update_all(["#{field_name} = #{field_name} + ?", reward_amount])
          AssetFlow.create(
            user_id: dst_user.id,
            account_type: :packet,
            asset_type: :usdt,
            flow_type: :agent_reward,
            amount: reward_amount
          )
          total_reward += reward_amount
          break if rate == MAX_COMMISSION_RATE
          same_rewarded = true
        end
      end
      break unless (dst_user = dst_user.parent)
    end if dst_user
    total_reward
  end

  def reward_new_buy(vip_usdt, agent_usdt, asset_type, flow_type)
    dst_user = parent
    vip_reward = agent_reward = 0
    total_reward = 0
    field_name =
      if asset_type == :usdt
        'packet_usdt_available'
      else
        'candy_available'
      end
    8.times do |i|
      if i == 0
        vip_reward = (vip_usdt * 0.3).floor(6)
        agent_reward = (agent_usdt * 0.3).floor(6)
      else
        vip_reward = (vip_reward * 0.5).floor(6)
        agent_reward = (agent_reward * 0.5).floor(6)
      end
      if dst_user.vip?
        User.where(id: dst_user.id).update_all(["#{field_name} = #{field_name} + ?", vip_reward])
        AssetFlow.create(
          user_id: dst_user.id,
          asset_type: asset_type,
          account_type: :packet,
          flow_type: flow_type,
          amount: vip_reward
        )
        total_reward += vip_reward
      elsif dst_user.agent?
        User.where(id: dst_user.id).update_all(["#{field_name} = #{field_name} + ?", agent_reward])
        AssetFlow.create(
          user_id: dst_user.id,
          asset_type: asset_type,
          account_type: :packet,
          flow_type: flow_type,
          amount: agent_reward
        )
        total_reward += agent_reward
      end
      break unless (dst_user = dst_user.parent)
    end if dst_user
    total_reward
  end

  def sync_team_user_amount
    amount = 0
    children.each do |child|
      amount += 1 + child.sync_team_user_amount
    end
    update(team_user_amount: amount)
    amount
  end

  def revert_frozen_error
    users = []
    User.find_each do |user|
      user.with_lock do
        if GameWaiter.where(user_id: user.id).count == 0 && UserRoom.where(user_id: user.id, joined: true).count == 0 && user.packet_usdt_frozen > 0
          users << user
        end
      end
    end
    users
  end

  private

  def gen_session
    UserSession.create(user: self)
    dst_user = self
    loop do
      if (parent = dst_user.parent)
        User.where(id: parent.id).update_all('team_user_amount = team_user_amount + 1')
        dst_user = parent
      else
        break
      end
    end
  end
end
