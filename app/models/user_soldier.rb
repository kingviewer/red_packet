class UserSoldier < ApplicationRecord
  enum state: [:free, :working]

  belongs_to :user
  belongs_to :soldier

  def set_working_finished
    bomb = Bomb.find_by(user_id: user_id, soldier_id: soldier_id) ||
      Bomb.create(
        user: user,
        soldier: soldier
      )
    Bomb.where(id: bomb.id).update_all(['amount = amount + ?', amount])
    if left_duration - 1 <= 0
      update(state: :free, expired: true, left_duration: 0)
    else
      update(state: :free, left_duration: left_duration - 1)
    end
    BombFlow.create(
      user: user,
      soldier: soldier,
      flow_type: :search,
      amount: amount
    )
  end
end
