class CreateBombFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :bomb_flows, comment: '炸弹流水' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :soldier, null: false, index: true, comment: '工兵ID'
      t.integer :flow_type, null: false, index: true, comment: '流水类型'
      t.bigint :amount, null: false, comment: '数量'

      t.timestamps
    end
  end
end
