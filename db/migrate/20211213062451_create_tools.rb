class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools, comment: '道具' do |t|
      t.integer :increase_times, null: false, comment: '增产倍数'
      t.decimal :price, null: false, precision: 20, scale: 8, index: true, comment: '价格'
      t.boolean :on_shelf, null: false, default: false, index: true, comment: '是否上架'

      t.timestamps
    end
  end
end
