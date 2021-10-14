class AssetFlowsController < BaseUserController
  layout 'user'

  before_action :auth_user, only: :index
  before_action :ajax_auth_user, only: :list_my

  def index
    @account_type = params[:account_type] || 'packet'
    @asset_type = params[:asset_type] || 'usdt'
    @title = "#{t('.title')}-#{t(@account_type == 'packet' ? 'utils.accounts.packet' : 'utils.accounts.wallet')}"
    @symbol = (@asset_type == 'usdt' ? 'USDT' : 'BOMB')
  end

  def list_my
    data = []
    AssetFlow.where(user_id: cur_user.id, asset_type: params[:asset_type], account_type: params[:account_type])
             .order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |flow|
      data << {
        id: flow.id,
        flow_type: flow.flow_type,
        flow_type_name: flow.flow_type_name,
        amount: "#{flow.amount > 0 ? '+' : ''}#{LZUtils.format_coin(flow.amount)}",
        created_at: flow.formatted_created_at
      }
    end
    success(data)
  end
end
