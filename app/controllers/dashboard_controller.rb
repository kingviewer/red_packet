class DashboardController < BaseUserController
  layout 'user_dashboard'
  before_action :auth_user

  def index
    redirect_to '/'
  end
end
