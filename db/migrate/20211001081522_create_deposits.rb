class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits, comment: '充值/托管' do |t|
      t.references :user, index: true, comment: '用户ID'
      t.string :tx_hash, null: false, limit: 80, index: true, comment: 'TX Hash'
      t.integer :asset_type, null: false, index: true, comment: '资产类型'
      t.string :address, limit: 50, index: true, comment: '源地址'
      t.decimal :amount, precision: 20, scale: 8, comment: '数量'

      t.timestamps
    end
  end
end
