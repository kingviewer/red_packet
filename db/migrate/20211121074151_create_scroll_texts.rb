class CreateScrollTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :scroll_texts, comment: '首页滚动提示' do |t|
      t.string :content, limit: 500, comment: '内容'
      t.string :lang, null: false, index: true, comment: '语言'

      t.timestamps
    end
  end
end
