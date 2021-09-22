class Admin::DashboardController < Admin::BaseController
  before_action :auth_admin

  def index
  end
end
