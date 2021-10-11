class GameRoom < ApplicationRecord
  # 进行中，停止(创建人解散、创建人掉线)
  enum state: [:playing, :stopped]

  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  validates :loser_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def check_win
    users = User.joins(:user_room).where(user_rooms: { game_room_id: id, joined: true })
    if users.count == player_amount # 开奖
      result = Game.judge_winners(usdt_amount, users, loser_amount)
      # 所有joind改为false
      UserRoom.where(game_room_id: id, joined: true).update_all(joined: false)
      # 创建GameRound记录
      game_round = GameRound.create(game_room_id: id)
      result[:losers].each do |loser|
        UserGameRound.create(
          user_id: loser.id,
          game_round_id: game_round.id,
          usdt_frozen: usdt_amount,
          usdt_won: 0,
          loser: true
        )
      end
      result[:winners].each do |winner|
        UserGameRound.create(
          user_id: winner[:user].id,
          game_round_id: game_round.id,
          usdt_frozen: usdt_amount,
          usdt_won: winner[:win],
          loser: false
        )
      end
      BroadcastRoomWinJob.perform_later(self, game_round)
      game_round.id
    end
  end
end
