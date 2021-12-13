class ToolsController < BaseUserController
  before_action :ajax_auth_user, only: [:buy]

  def list_all
    data = []
    Tool.where(on_shelf: true).order(price: :asc).each do |tool|
      data << {
        id: tool.id,
        name: tool.name,
        price: LZUtils.format_coin(tool.price),
        increase_percent: "#{tool.increase_times * 100}%",
        image: tool.image.service_url
      }
    end
    success(data)
  end

  def buy
    amount = params[:amount].to_i
    if amount <= 0
      invalid_params
    elsif not (tool = Tool.find_by(id: params[:id], on_shelf: true))
      error(t('tools.buy.tool_not_exist'))
    elsif cur_user.candy_available < tool.price * amount
      error(t('dashboard.index.balance_insufficient'))
    else
      cur_user.with_lock do
        if cur_user.candy_available < tool.price * amount
          error(t('dashboard.index.balance_insufficient'))
        else
          cur_user.update(candy_available: cur_user.candy_available - tool.price * amount)
          UserTool.increase_for_user(cur_user.id, tool.id, amount)
          success
        end
      end
    end
  end
end
