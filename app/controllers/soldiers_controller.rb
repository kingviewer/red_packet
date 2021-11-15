class SoldiersController < BaseUserController
  def list_all
    data = []
    Soldier.where(on_shelf: true).order(price: :asc).each do |soldier|
      data << {
        id: soldier.id,
        level: soldier.level,
        price: soldier.price,
        power: soldier.power,
        duration: soldier.duration,
        max_employ_amount: soldier.max_employ_amount,
        contribution: soldier.contribution,
        image: soldier.image.service_url
      }
    end
    success(data)
  end

  def buy
    if not (soldier = Soldier.find_by(id: params[:id], on_shelf: true))
      error(t('.soldier_not_exist'))
    else
      cur_user.with_lock do
        if cur_user.candy_available < soldier.price
          error(t('dashboard.index.balance_insufficient'))
        elsif cur_user.user_soldiers.where(id: soldier.id).count >= soldier.max_employ_amount
          error(t('.max_employ_amount'))
        else
          cur_user.update(candy_available: cur_user.candy_available - soldier.price)
          UserSoldier.create(
            user: cur_user,
            soldier: soldier,
            left_duration: soldier.duration
          )
          AssetFlow.create(
            user_id: cur_user.id,
            flow_type: :buy_soldier,
            asset_type: :cigar,
            account_type: :packet,
            amount: soldier.price
          )
          if soldier.contribution > 0
            cur_user.new_contribution(soldier.contribution)
          end
          success
        end
      end
    end
  end
end
