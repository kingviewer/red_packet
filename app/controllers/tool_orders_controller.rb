class ToolOrdersController < BaseUserController
  before_action :ajax_auth_user, only: :list_my

  def list_my
    data = []
    relation = ToolOrder.where(user_id: cur_user.id)
    relation.includes(:tool).
      limit(params[:limit].to_i).offset(params[:limit].to_i * (params[:page].to_i - 1)).each do |order|
      data << {
        id: order.id,
        price: LZUtils.format_coin(order.price),
        tool_name: order.tool.name,
        tool_image: order.tool.image.service_url,
        amount: order.amount,
        created_at: order.formatted_created_at
      }
    end
    success(total: relation.count, items: data)
  end
end
