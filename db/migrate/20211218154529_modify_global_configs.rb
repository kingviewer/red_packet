class ModifyGlobalConfigs < ActiveRecord::Migration[6.1]
  def change
    change_column :global_configs, :exchange_pliers_price, :decimal, precision: 20, scale: 8, null: false, comment: '兑换绳子价格'
    change_column :global_configs, :pk_pliers_price, :decimal, precision: 20, scale: 8, null: false, comment: 'PK绳子价格'
  end
end
