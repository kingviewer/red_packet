class CreateBombs < ActiveRecord::Migration[6.1]
  def change
    create_table :bombs, comment: '炸弹/雷' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :soldier, null: false, index: true, comment: '工兵ID'
      t.bigint :amount, null: false, default: 0, comment: '数量'

      t.timestamps
    end
  end
end
