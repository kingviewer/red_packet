class GameRoom < ApplicationRecord
  # 进行中，停止(创建人解散、创建人掉线)
  enum state: [:playing, :stopped]

  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :game

  validates :loser_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def check_win
    users = User.joins(:user_room).where(user_rooms: { game_room_id: id, joined: true })
    if users.count == game.player_amount # 开奖
      result = Game.judge_winners(game.usdt_amount, users, loser_amount)
      global_config = GlobalConfig.first

      # 输家给Candy
      result[:losers].each do |loser|
        candy_amount = (game.usdt_amount * 0.01 / global_config.cigar_usdt_price).floor(6)
        User.where(id: loser.id).update_all(
          ['packet_usdt_frozen = packet_usdt_frozen - ?, candy_available = candy_available + ?', game.usdt_amount,
           candy_amount]
        )
        AssetFlow.create(
          user_id: loser.id,
          asset_type: :usdt,
          flow_type: :lose,
          amount: -game.usdt_amount
        )
        AssetFlow.create(
          user_id: loser.id,
          asset_type: :candy,
          flow_type: :lose_reward,
          amount: candy_amount
        )
      end

      # 赢家给USDT
      result[:winners].each do |winner|
        User.where(winner[:user].id).update_all(
          ['packet_usdt_available = packet_usdt_available + ?, packet_usdt_frozen = packet_usdt_frozen - ?',
           game.usdt_amount + winner[:win], game.usdt_amount]
        )
        AssetFlow.create(
          user_id: winner[:user].id,
          asset_type: :usdt,
          flow_type: :win,
          amount: winner[:win]
        )
      end

      # 所有joind改为false
      UserRoom.where(game_room_id: id, joined: true).update_all(joined: false)

      BroadcastRoomWinJob.perform_later(self, result[:winners])
    end
  end
end
