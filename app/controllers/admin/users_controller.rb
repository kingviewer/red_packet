class Admin::UsersController < Admin::BaseController
  before_action :auth_admin, only: [:index, :tree]
  before_action only: [:set_agent] do
    ajax_auth_admin('admin')
  end

  def index
  end

  def tree
  end

  def set_agent
    if not (user = User.find_by(id: params[:id]))
      error('用户不存在')
    elsif user.agent?
      error('该用户已经是代理')
    else
      _set_agent(user, user)
    end
  end

  private

  def _set_agent(agent, user)
    user.children.each do |child|
      child.update(agent_id: agent.id)
      _set_agent(agent, child) unless child.agent?
    end
  end
end
