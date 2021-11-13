class Admin::AssetFlowsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: :list_for_table

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
        account_type_name: flow.account_type_name,
        flow_type_name: flow.flow_type_name,
        asset_type_name: flow.asset_type_name,
        amount: LZUtils.format_coin(flow.amount),
        tx_hash: flow.tx_hash,
        created_at: flow.formatted_created_at
      }
    end
    ok(rows: data, total: relation.count)
  end

  def statistics
    success(total: LZUtils.format_coin(list_relation.sum(:amount)))
  end

  private

  def list_relation
    relation = AssetFlow.includes(:user).joins(:user)
    unless params[:keyword].blank?
      keyword = params[:keyword].strip
      relation = relation.where(['users.address like ? or users.invite_code like ?', "%#{keyword}%", "%#{keyword}%"])
    end
    relation = relation.where(account_type: params[:account_type]) unless params[:account_type].blank?
    relation = relation.where(asset_type: params[:asset_type]) unless params[:asset_type].blank?
    relation = relation.where(flow_type: params[:flow_type]) unless params[:flow_type].blank?
    relation = relation.where(['asset_flows.created_at >= ?', "#{params[:start_at].strip} 00:00:00.000000"]) unless params[:start_at].blank?
    relation = relation.where(['asset_flows.created_at <= ?', "#{params[:end_at].strip} 23:59:59.999999"]) unless params[:end_at].blank?
    relation
  end
end
