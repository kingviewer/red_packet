class UserToolsController < BaseUserController
  before_action :ajax_auth_user, only: :list_my

  def list_my
    data = []
    UserTool.available.includes(:tool).order(amount: :desc).each do |ut|
      data << {
        id: ut.id,
        name: ut.tool.name,
        increase_percent: "#{ut.tool.increase_times * 100}%",
        image: ut.tool.image.service_url,
        amount: ut.amount
      }
    end
    success(data)
  end
end
