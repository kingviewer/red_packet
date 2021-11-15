class CreateSoldiers < ActiveRecord::Migration[6.1]
  def change
    create_table :soldiers, comment: '工兵' do |t|
      t.integer :price, null: false, index: true, comment: '价格'
      t.integer :duration, null: false, default: 7, comment: '雇佣周期，单位天'
      t.integer :max_employ_amount, null: false, comment: '单用户最多雇佣数量'
      t.integer :contribution, null: false, index: true, comment: '贡献值'
      t.integer :power, null: false, index: true, comment: '战力'
      t.decimal :bomb_cost, null: false, comment: '雷成本(CIC)'
      t.decimal :bomb_benefit, null: false, comment: '雷收益(CIC)'
      t.integer :bomb_cost_pliers, null: false, comment: '单个雷消耗钳子'
      t.string :bomb_no, null: false, limit: 20, index: true, comment: '雷编号'
      t.boolean :on_shelf, null: false, default: false, index: true, comment: '是否上架'

      t.timestamps
    end
  end
end
