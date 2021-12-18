class Admin::UserSoldiersController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:list_for_table, :statistics]

  def index
  end

  def list_for_table
    data = []
    relation = list_relation
    relation.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |us|
      data << {
        id: us.id,
        invite_code: us.user.invite_code,
        address: us.user.address,
        level: us.soldier.level,
        amount: us.amount,
        state_name: us.state_name,
        left_secs: us.working? ? (us.start_working_at.since(us.soldier.working_duration.minutes) - Time.now).to_i : 0,
        left_duration: us.left_duration,
        expired: us.expired,
        created_at: us.formatted_created_at
      }
    end
    ok(rows: data, total: relation.count)
  end

  def statistics
    success(total: list_relation.sum(:amount))
  end

  private

  def list_relation
    relation = UserSoldier.includes(:user, :soldier).joins(:user)
    unless params[:keyword].blank?
      keyword = params[:keyword].strip
      relation = relation.where(['users.address like ? or users.invite_code like ?', "%#{keyword}%", "%#{keyword}%"])
    end
    relation = relation.where(soldier_id: params[:soldier_id]) unless params[:soldier_id].blank?
    relation = relation.where(state: params[:state]) unless params[:state].blank?
    relation
  end
end
