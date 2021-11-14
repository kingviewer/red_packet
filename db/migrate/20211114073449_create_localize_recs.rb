class CreateLocalizeRecs < ActiveRecord::Migration[6.1]
  def change
    create_table :localize_recs, comment: '多语言辅助表' do |t|
      t.string :record_type, null: false, limit: 40, index: true, comment: '记录类型'
      t.bigint :record_id, null: false, index: true, comment: '记录id'
      t.string :locale, null: false, default: 'en', limit: 10, index: true, comment: '语言'
      t.string :content, null: false, limit: 500, comment: '实际内容'
      t.string :name, null: false, limit: 40, index: true, comment: '名称'

      t.timestamps
    end
  end
end
