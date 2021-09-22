class CreateUserGameRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_game_rounds,  comment: '用户-游戏轮次关系' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :game_round, null: false, index: true, comment: '游戏轮次ID'
      t.decimal :usdt_frozen, null: false, precision: 20, scale: 8, comment: '质押USDT数量'
      t.decimal :usdt_won, null: false, default: 0, precision: 20, scale: 8, comment: '红包结果(赢得USDT数量)'
      t.boolean :loser, null: false, default: false, index: true, comment: '是否Loser'

      t.timestamps
    end
  end
end
