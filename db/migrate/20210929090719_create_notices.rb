class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :language, null: false, index: true, comment: '语言'
      t.string :title, null: false, limit: 200, comment: '标题'
      t.string :content, null: false, limit: 1000, comment: '内容'

      t.timestamps
    end
  end
end
