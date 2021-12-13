class CreateUserTools < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tools, comment: '用户的道具' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :tool, null: false, index: true, comment: '道具ID'
      t.integer :amount, null: false, default: 0, index: true, comment: '数量'

      t.timestamps
    end
  end
end
