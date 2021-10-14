class CreateGameWaiters < ActiveRecord::Migration[6.1]
  def change
    create_table :game_waiters, comment: '游戏用户排队队列' do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :game, null: false, index: true, comment: '游戏ID'
      t.bigint :times, null: false, index: true, comment: '游戏轮次'

      t.timestamps
    end
  end
end
