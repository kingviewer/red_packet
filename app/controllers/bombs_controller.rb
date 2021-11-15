class BombsController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    cur_user.bombs.includes(:soldier).each do |bomb|
      data << {
        id: bomb.id,
        amount: bomb.amount,
        bomb_no: bomb.soldier.bomb_no,
        image: bomb.soldier.bomb_image.service_url
      }
    end
    success(data)
  end
end