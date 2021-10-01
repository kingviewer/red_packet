class DashboardController < BaseUserController
  layout 'user_dashboard'
  before_action :auth_user

  def index
  end
end
