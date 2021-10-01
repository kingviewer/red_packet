class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers, comment: '划转' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.integer :asset_type, null: false, index: true, comment: '资产类型'
      t.decimal :amount, null: false, precision: 20, scale: 8, comment: '数量'
      t.integer :state, null: false, index: true, comment: '状态'

      t.timestamps
    end
  end
end
