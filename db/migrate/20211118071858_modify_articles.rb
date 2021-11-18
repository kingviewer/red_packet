class ModifyArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :article_type
    add_column :articles, :title, :string, null: false, limit: 100, comment: '标题'
  end
end
