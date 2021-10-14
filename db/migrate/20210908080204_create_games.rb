class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.decimal :usdt_amount, null: false, precision: 20, scale: 8, comment: '红包金额'
      t.integer :player_amount, null: false, comment: '玩家数量'
      t.integer :loser_amount, null: false, comment: '输家数量'
      t.integer :waiter_amount, null: false, default: 0, comment: '排队人数'
      t.bigint :times, null: false, default: 1024, index: true, comment: '局，轮'

      t.timestamps
    end
  end
end
