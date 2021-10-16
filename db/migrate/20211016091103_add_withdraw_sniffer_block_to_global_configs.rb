class AddWithdrawSnifferBlockToGlobalConfigs < ActiveRecord::Migration[6.1]
  def change
    add_column :global_configs, :withdraw_sniffer_block, :bigint, null: false, default: 11818497, comment: 'Withdraw sniffer 开始区块'
  end
end
