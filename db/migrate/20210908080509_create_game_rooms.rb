class CreateGameRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :game_rooms, comment: '密码房' do |t|
      t.references :game, null: false, index: true, comment: '游戏'
      t.references :user, null: false, index: true, comment: '创建人'
      t.decimal :min_usdt_amount, null: false, precision: 20, scale: 8, comment: '最低USDT可用余额'
      t.string :password, null: false, limit: 8, comment: '房间密码'
      t.integer :loser_amount, null: false, comment: '输家数量'
      t.integer :state, null: false, default: 0, index: true, comment: '密码房状态'

      t.timestamps
    end
  end
end
