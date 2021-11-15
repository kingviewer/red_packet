class CreateUserSoldiers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_soldiers, comment: '用户购买的工兵' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :soldier, null: false, index: true, comment: '工兵ID'
      t.integer :price, null: false, comment: '购买价格'
      t.integer :duration, null: false, comment: '周期(执行任务数)'
      t.integer :left_duration, null: false, comment: '剩余周期(剩余执行任务数)'
      t.integer :contribution, null: false, index: true, comment: '贡献值'
      t.integer :power, null: false, index: true, comment: '战力'
      t.decimal :bomb_cost, null: false, comment: '雷成本(CIC)'
      t.decimal :bomb_benefit, null: false, comment: '雷收益(CIC)'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'

      t.timestamps
    end
  end
end
