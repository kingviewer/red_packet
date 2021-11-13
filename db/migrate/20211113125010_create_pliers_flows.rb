class CreatePliersFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :pliers_flows, comment: '钳子流水' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.integer :amount, null: false, comment: '数量'
      t.integer :flow_type, null: false, index: true, comment: '流水类型'

      t.timestamps
    end
  end
end
