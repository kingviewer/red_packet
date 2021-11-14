class AddFieldsToGlobalConfigs < ActiveRecord::Migration[6.1]
  def change
    add_column :global_configs, :exchange_pliers_price, :integer, null: false, default: 10, comment: '兑换钳子价格'
    add_column :global_configs, :pk_pliers_price, :integer, null: false, default: 10, comment: 'PK钳子价格'
  end
end
