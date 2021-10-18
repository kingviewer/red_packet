class AddTeamUserAmountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :team_user_amount, :bigint, null: false, default: 0, comment: '伞下用户数'
  end
end
