class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pliers_amount, :bigint, null: false, default: 0, comment: '钳子数'
    add_column :users, :air_drop_gotten, :boolean, null: false, default: false, comment: '空投是否已领'
  end
end
