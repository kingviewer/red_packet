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
    if (working_record = WorkingRecord.working.where(user_soldier_id: id).last)
      _amount =
        if working_record.user_tool_id && working_record.user_tool&.using?
          working_record.user_tool.used!
          amount * (1 + working_record.user_tool.tool.increase_times)
        else
          amount
        end
      working_record.finished!
      Bomb.where(id: bomb.id).update_all(['amount = amount + ?', _amount])
      free!
      BombFlow.create(
        user: user,
        soldier: soldier,
        flow_type: :search,
        amount: _amount
      )
    end
  end

  def state_name
    I18n.t("models.user_soldier.states.#{state}")
  end
end
