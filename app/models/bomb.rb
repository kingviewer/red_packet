class Bomb < ApplicationRecord
  belongs_to :user
  belongs_to :soldier

  # 拆弹
  def disposal(count)
    raise I18n.t('bombs.disposal.bomb_insufficient') if amount < count
    pliers_amount = soldier.bomb_cost_pliers * count
    User.where(id: user_id).update_all(['pliers_amount = pliers_amount - ?', pliers_amount])
    user.reload
    raise I18n.t('bombs.disposal.pliers_insufficient') if user.pliers_amount < 0
    PliersFlow.create(
      user: user,
      flow_type: :disposal,
      amount: -pliers_amount
    )

    # 自己收益
    benefit = soldier.bomb_benefit * count
    reward_cic = soldier.bomb_cost * count + benefit
    User.where(id: user_id).update_all(['candy_available = candy_available + ?', reward_cic])
    AssetFlow.create(
      user: user,
      account_type: :packet,
      asset_type: :cigar,
      flow_type: :disposal,
      amount: reward_cic
    )

    # 上级收益
    rewarded_rate = 0
    pre_role = nil
    same_rewarded = false
    pre_reward = 0
    height = 1

    if (dst_user = user.parent)
      loop do
        if dst_user.role == 'pai' && height == 1
          rate = Utils::Constants::REWARD_RATES[:pai][:rate]
          reward = (benefit * rate).floor(8)
          rewarded_rate = rate
          reward_cic(dst_user.id, reward, :disposal_dynamic)
        elsif !dst_user.user? && !dst_user.pai?
          if pre_role && dst_user.role == pre_role && !same_rewarded
            same_rewarded = true
            rate = Utils::Constants::REWARD_RATES[dst_user.role.to_sym][:same_role]
            reward = (pre_reward * rate).floor(8)
            reward_cic(dst_user.id, reward, :disposal_dynamic_same)
            break if dst_user.jun?
            pre_role = dst_user.role
          else
            same_rewarded = false
            rate = Utils::Constants::REWARD_RATES[dst_user.role.to_sym][:rate]
            dif_rate = rate - rewarded_rate
            if dif_rate > 0
              pre_role = dst_user.role
              rewarded_rate = rate
              reward = (benefit * dif_rate).floor(8)
              reward_cic(dst_user.id, reward, :disposal_dynamic)
              pre_reward = reward
            end
          end
        end
        break unless (dst_user = dst_user.parent)
        height += 1
      end
    end

    # 减数量
    if amount == count
      destroy
    else
      update(amount: amount - count)
    end
  end

  private

  def reward_cic(user_id, amount, flow_type)
    if amount > 0
      User.where(id: user_id).update_all(['candy_available = candy_available + ?', amount])
      AssetFlow.create(
        user_id: user_id,
        asset_type: :cigar,
        account_type: :packet,
        flow_type: flow_type,
        amount: amount
      )
    end
  end

end
