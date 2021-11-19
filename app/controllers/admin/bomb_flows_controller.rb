class Admin::BombFlowsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:list_for_table, :statistics]

  def index
  end

  def list_for_table
    data = []
    relation = list_relation
    relation.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |flow|
      data << {
        id: flow.id,
        invite_code: flow.user.invite_code,
        address: flow.user.address,
        flow_type_name: flow.flow_type_name,
        amount: flow.amount,
        bomb_no: flow.soldier.bomb_no,
        created_at: flow.formatted_created_at
      }
    end
    ok(rows: data, total: relation.count)
  end

  def statistics
    success(total: list_relation.sum(:amount))
  end

  private

  def list_relation
    relation = BombFlow.includes(:user, :soldier).joins(:user)
    unless params[:keyword].blank?
      keyword = params[:keyword].strip
      relation = relation.where(['users.address like ? or users.invite_code like ?', "%#{keyword}%", "%#{keyword}%"])
    end
    relation = relation.where(flow_type: params[:flow_type]) unless params[:flow_type].blank?
    relation = relation.where(soldier_id: params[:soldier_id]) unless params[:soldier_id].blank?
    relation = relation.where(['bomb_flows.created_at >= ?', "#{params[:start_at].strip} 00:00:00.000000"]) unless params[:start_at].blank?
    relation = relation.where(['bomb_flows.created_at <= ?', "#{params[:end_at].strip} 23:59:59.999999"]) unless params[:end_at].blank?
    relation
  end
end
