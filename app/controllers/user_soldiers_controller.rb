class UserSoldiersController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    relation = cur_user.user_soldiers.includes(:soldier).where(expired: false)
    relation = relation.where(state: params[:state]) unless params[:state].blank?
    relation.order(id: :desc).each do |us|
      data << {
        level: us.soldier.level,
        amount: us.amount,
        left_duration: us.left_duration,
        contribution: us.soldier.contribution,
        power: us.soldier.power,
        image: us.soldier.image.service_url,
        state: us.state
      }
    end
    success(data)
  end
end
