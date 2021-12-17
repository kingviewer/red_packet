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
    BombFlow.create(
      user: user,
      soldier_id: soldier_id,
      flow_type: :disposal,
      amount: -count
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

    # 直推收益
    if (dst_user = user.parent)
      reward = (reward_cic * 0.1).floor(8)
      reward_cic(dst_user.id, reward, :disposal_dynamic)
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
