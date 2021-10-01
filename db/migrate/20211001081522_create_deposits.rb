class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.references :user, index: true, comment: '用户ID'
      t.string :tx_hash, null: false, limit: 80, index: true, comment: 'TX Hash'
      t.string :address, limit: 50, index: true, comment: '源地址'
      t.decimal :amount, precision: 20, scale: 8, comment: '数量'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'

      t.timestamps
    end
  end
end
