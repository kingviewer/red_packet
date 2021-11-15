class User < ApplicationRecord
  enum role: [:user, :pai, :lian, :ying, :tuan, :shi, :jun]
  enum state: [:normal, :locked]

  belongs_to :parent, foreign_key: :parent_id, class_name: 'User', required: false
  has_one :user_session
  has_many :children, foreign_key: :parent_id, class_name: 'User'
  has_many :game_room
  has_many :game_waiters
  has_one :user_room
  has_many :user_soldiers
  has_many :bombs

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
        if GameWaiter.joins(:game).where(user_id: user.id).sum('games.usdt_amount') +
          UserRoom.joins(:game_room).where(user_id: user.id, joined: true).sum('game_rooms.usdt_amount') >
          user.packet_usdt_frozen
          users << user
        end
      end
    end
    users
  end

  # 新增/减贡献值，更新贡献、级别
  def new_contribution(contribution)
    self.my_contribution += contribution
    role_amount = update_new_role
    save
    parent&.sync_for_contribution(
      contribution, role_amount[:pai], role_amount[:lian], role_amount[:ying], role_amount[:tuan],
      role_amount[:shi], role_amount[:jun]
    )
  end

  # 增加团队贡献，更新团队贡献、级别
  def sync_for_contribution(contribution, _pai = 0, _lian = 0, _ying = 0, _tuan = 0, _shi = 0, _jun = 0)
    self.team_contribution += contribution
    self.team_pai += _pai
    self.team_lian += _lian
    self.team_ying += _ying
    self.team_tuan += _tuan
    self.team_shi += _shi
    self.team_jun += _jun
    role_amount = update_new_role
    save
    parent&.sync_for_contribution(
      contribution, role_amount[:pai], role_amount[:lian], role_amount[:ying], role_amount[:tuan],
      role_amount[:shi], role_amount[:jun]
    )
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

  def judge_role
    if self.team_contribution >= 5000 && children.where(['team_jun >= 1 or team_shi >= 1']).count >= 2
      :jun
    elsif self.team_contribution >= 3000 && children.where(['team_jun >= 1 or team_shi >= 1 or team_tuan >= 1']).count >= 2
      :shi
    elsif self.team_contribution >= 1000 && children.where(['team_jun >= 1 or team_shi >= 1 or team_tuan >= 1 or team_ying >= 1']).count >= 2
      :tuan
    elsif self.team_contribution >= 200 && children.where(['team_jun >= 1 or team_shi >= 1 or team_tuan >= 1 or team_ying >= 1 or team_lian >= 1']).count >= 2
      :ying
    elsif self.team_contribution >= 20 && children.where(['team_jun >= 1 or team_shi >= 1 or team_tuan >= 1 or team_ying >= 1 or team_lian >= 1 or team_pai >= 1']).count >= 2
      :lian
    elsif self.my_contribution > 0
      :pai
    else
      :user
    end
  end

  def calc_role_change(new_role)
    _pai = _lian = _ying = _tuan = _shi = _jun = 0
    if pai?
      _pai -= 1
    elsif lian?
      _lian -= 1
    elsif ying?
      _ying -= 1
    elsif tuan?
      _tuan -= 1
    elsif shi?
      _shi -= 1
    elsif jun?
      _jun -= 1
    end
    case new_role
    when :pai
      _pai += 1
    when :lian
      _lian += 1
    when :ying
      _ying += 1
    when :tuan
      _tuan += 1
    when :shi
      _shi += 1
    when :jun
      _jun += 1
    end
    {
      pai: _pai,
      lian: _lian,
      ying: _ying,
      tuan: _tuan,
      shi: _shi,
      jun: _jun
    }
  end

  def update_new_role
    new_role = judge_role
    if role != new_role
      role_amount = calc_role_change(new_role)
      self.team_pai += role_amount[:pai]
      self.team_lian += role_amount[:lian]
      self.team_ying += role_amount[:ying]
      self.team_tuan += role_amount[:tuan]
      self.team_shi += role_amount[:shi]
      self.team_jun += role_amount[:jun]
      self.role = new_role
      role_amount
    else
      {
        pai: 0,
        lian: 0,
        ying: 0,
        tuan: 0,
        shi: 0,
        jun: 0
      }
    end
  end
end
