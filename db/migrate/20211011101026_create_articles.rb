class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :article_type, null: false, index: true, comment: '文章类型'
      t.integer :lang, null: false, index: true, comment: '语言'

      t.timestamps
    end
  end
end
