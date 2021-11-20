class BombsController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    cur_user.bombs.includes(:soldier).each do |bomb|
      data << {
        id: bomb.id,
        amount: bomb.amount,
        bomb_no: bomb.soldier.bomb_no,
        cost_pliers: bomb.soldier.bomb_cost_pliers,
        image: bomb.soldier.bomb_image.service_url
      }
    end
    success(data)
  end

  def cost_pliers
    if not (bomb = cur_user.bombs.find_by(id: params[:id]))
      error(t('bombs.disposal.bomb_not_exist'))
    else
      success(cost_pliers: bomb.soldier.bomb_cost_pliers)
    end
  end

  def disposal
    amount = params[:amount].to_i
    if amount <= 0
      invalid_params
    elsif not (bomb = Bomb.find_by(user_id: cur_user.id, id: params[:id]))
      error(t('.bomb_not_exist'))
    else
      begin
        bomb.with_lock do
          bomb.disposal(amount)
          success
        end
      rescue => e
        error(e.message)
      end
    end
  end
end