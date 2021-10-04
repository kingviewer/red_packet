class CreateGlobalConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :global_configs do |t|
      t.decimal :cigar_usdt_price, null: false, default: 0.001, comment: 'CIC/USDT 价格'
      t.decimal :loser_candy_rate, null: false, default: 0.01, precision: 5, scale: 4, comment: '输家送糖果占USDT比例'
      t.decimal :fee_rate, null: false, default: 0.01, precision: 5, scale: 4, comment: '开奖费用占比'
      t.decimal :parent_reward_rate, null: false, default: 0.01, precision: 5, scale: 4, comment: '直推分润比例'
      t.decimal :grand_reward_rate, null: false, default: 0.005, precision: 5, scale: 4, comment: '间推分润比例'

      t.bigint :inner_deposit_sniffer_block, null: false, default: 1, comment: 'Deposit Sniffer开始区块'

      t.timestamps
    end
  end
end
