class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :file_name, limit: 256, null: false, comment: '图片名'
      t.boolean :deleted, null: false, default: false, index: true, comment: '删除标记'

      t.timestamps
    end
  end
end
