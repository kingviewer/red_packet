class CreateGameRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :game_rounds, comment: '游戏轮次，盘，把' do |t|
      t.references :game, null: false, index: true, comment: '游戏ID'
      t.references :game_room, index: true, comment: '密码房ID'

      t.timestamps
    end
  end
end
