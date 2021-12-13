class Admin::ToolsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [
    :list_for_table, :create, :update, :set_on_shelf, :set_off_shelf, :localize_info, :set_localize
  ]

  def index
  end

  def list_for_table
    data = []
    Tool.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |item|
      data << {
        id: item.id,
        name: item.name('zh-CN'),
        price: item.price,
        increase_times: item.increase_times,
        on_shelf: item.on_shelf,
        image: item.image.service_url
      }
    end
    ok(total: Tool.count, rows: data)
  end

  def create
    tool = Tool.new(params.require(:tool).
      permit(:price, :increase_times, :image))
    if tool.save
      tool.set_name(params[:tool][:name], 'zh-CN')
      success
    else
      error(tool.errors.full_messages[0])
    end
  end

  def update
    if not (tool = Tool.find_by(id: params[:id]))
      error('道具不存在')
    else
      tool.attributes = params.require(:tool).
        permit(:price, :increase_times, :image)
      if tool.save
        tool.set_name(params[:tool][:name], 'zh-CN')
        success
      else
        error(tool.errors.full_messages[0])
      end
    end
  end

  def set_on_shelf
    if not (tool = Tool.find_by(id: params[:id]))
      error('道具不存在')
    else
      tool.update(on_shelf: true)
      success
    end
  end

  def set_off_shelf
    if not (tool = Tool.find_by(id: params[:id]))
      error('道具不存在')
    else
      tool.update(on_shelf: false)
      success
    end
  end

  def localize_info
    if not (tool = Tool.find_by(id: params[:id]))
      error('道具不存在')
    else
      success(
        level: tool.name(params[:lang])
      )
    end
  end

  def set_localize
    if not (tool = Tool.find_by(id: params[:id]))
      error('道具不存在')
    else
      tool.set_name(params[:tool][:name], params[:lang])
      success
    end
  end

end
