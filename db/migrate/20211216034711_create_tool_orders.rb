class CreateToolOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :tool_orders, comment: '道具购买记录' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :tool, null: false, index: true, comment: '道具ID'
      t.decimal :price, null: false, precision: 20, scale: 8, comment: '价格'
      t.integer :amount, null: false, comment: '数量'

      t.timestamps
    end
  end
end
