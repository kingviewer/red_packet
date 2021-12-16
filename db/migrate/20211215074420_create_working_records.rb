class CreateWorkingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :working_records, comment: '英雄工作记录' do |t|
      t.references :user_soldier, null: false, index: true, comment: '用户英雄ID'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'
      t.references :user_tool, comment: '道具ID'

      t.timestamps
    end
  end
end
