class CreateUserSoldiers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_soldiers, comment: '用户购买的工兵' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :soldier, null: false, index: true, comment: '工兵ID'
      t.integer :amount, null: false, comment: '工兵数'
      t.integer :left_duration, null: false, comment: '剩余周期(剩余执行任务数)'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'
      t.boolean :expired, null: false, default: false, index: true, comment: '是否已过期'
      t.datetime :start_working_at, index: true, comment: '开始工作时间'

      t.timestamps
    end
  end
end
