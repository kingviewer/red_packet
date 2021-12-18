class UserTool < ApplicationRecord
  enum state: [:available, :using, :used]

  belongs_to :user
  belongs_to :tool

  def self.increase_for_user(user_id, tool_id, amount)
    user_tool = UserTool.find_by(user_id: user_id, tool_id: tool_id) ||
      UserTool.create(user_id: user_id, tool_id: tool_id)
    UserTool.where(id: user_tool.id).update_all(['amount = amount + ?, state = ?', amount, :available])
  end
end
