class ModifySoldiers < ActiveRecord::Migration[6.1]
  def change
    change_column :soldiers, :bomb_benefit, :decimal, null: false, precision: 20, scale: 8, comment: '雷收益'
    change_column :soldiers, :bomb_cost, :decimal, null: false, precision: 20, scale: 8, comment: '雷成本'
  end
end
