class BombFlowsController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    if (bomb = Bomb.find_by(id: params[:bomb_id], user_id: cur_user.id))
      cur_user.bomb_flows.where(soldier_id: bomb.soldier_id).order(id: :desc).limit(50).each do |flow|
        data << {
          id: flow.id,
          flow_type: flow.flow_type,
          flow_type_name: flow.flow_type_name,
          amount: flow.amount,
          image: bomb.soldier.bomb_image.service_url,
          created_at: flow.formatted_created_at
        }
      end
    end
    success(data)
  end
end
