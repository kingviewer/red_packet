class CreateSysFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :sys_flows do |t|
      t.references :sys_account, null: false, index: true, comment: '系统账户ID'
      t.integer :flow_type, null: false, index: true, comment: '流水类型'
      t.decimal :amount, null: false, precision: 20, scale: 8, comment: '金额'
      t.string :remark, limit: 100, comment: '备注'
      t.references :admin, index: true, comment: '后台操作人ID'

      t.timestamps
    end
  end
end
