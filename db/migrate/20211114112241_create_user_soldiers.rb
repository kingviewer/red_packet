class CreateUserSoldiers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_soldiers, comment: '用户购买的工兵' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :soldier, null: false, index: true, comment: '工兵ID'
      t.integer :amount, null: false, comment: '工兵数'
      t.integer :left_duration, null: false, comment: '剩余周期(剩余执行任务数)'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'
      t.boolean :expired, null: false, default: false, index: true, comment: '是否已过期'
      t.integer :gen_bomb, null: false, default: 0, comment: '产雷数量'
      t.decimal :gen_cic, null: false, default: 0, precision: 20, scale: 8, comment: '产CIC数量'

      t.timestamps
    end
  end
end
