class Admin::SysFlowsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, except: :index

  def index
  end

  def list_for_table
    data = []
    relation = list_relation
    relation.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |flow|
      data << {
        id: flow.id,
        account_type_name: flow.sys_account.account_type_name,
        flow_type_name: flow.flow_type_name,
        asset_symbol: flow.sys_account.asset_symbol,
        amount: LZUtils.format_coin(flow.amount),
        admin: flow.admin&.account,
        remark: flow.remark,
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
    relation = SysFlow.includes(:admin, :sys_account)
    relation = relation.where(sys_account_id: params[:sys_account_id]) unless params[:sys_account_id].blank?
    relation = relation.where(flow_type: params[:flow_type]) unless params[:flow_type].blank?
    relation = relation.where(['sys_flows.created_at >= ?', "#{params[:start_at].strip} 00:00:00.000000"]) unless params[:start_at].blank?
    relation.where(['sys_flows.created_at <= ?', "#{params[:end_at].strip} 23:59:59.999999"]) unless params[:end_at].blank?
    relation
  end
end
