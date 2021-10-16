class AddTxHashToAssetFlows < ActiveRecord::Migration[6.1]
  def change
    add_column :asset_flows, :tx_hash, :string, limit: 80
    add_index :asset_flows, :tx_hash, unique: true
  end
end
