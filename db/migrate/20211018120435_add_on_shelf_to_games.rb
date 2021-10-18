class AddOnShelfToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :on_shelf, :boolean, null: false, default: false, comment: '是否上架'
    add_index :games, :on_shelf
  end
end
