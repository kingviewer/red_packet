class AddUserSniffToGlobalConfigs < ActiveRecord::Migration[6.1]
  def change
    add_column :global_configs, :user_sniffer_index, :bigint, null: false, default: 0, comment: '同步用户注册用户下标'
    add_column :users, :pending_parent, :string, limit: 80, index: true, comment: '同步用户邀请关系使用'
  end
end
