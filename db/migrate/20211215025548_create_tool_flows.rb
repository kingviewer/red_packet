class CreateToolFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :tool_flows, comment: '道具明细' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :tool, null: false, index: true, comment: '道具ID'
      t.integer :flow_type, null: false, index: true, comment: '流水类型'
      t.integer :amount, null: false, comment: '数量'

      t.timestamps
    end
  end
end
