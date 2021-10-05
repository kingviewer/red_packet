class Game < ApplicationRecord
  validates :usdt_amount, presence: true, numericality: { greater_than_or_equal_to: 0.00000001 }
  validates :player_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2 }
  validates :loser_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  has_many :game_waiters

  class << self
    # 拆红包逻辑 & 奖励
    def judge_winners(usdt_amount, players, loser_amount)
      players = players.to_a if players.is_a?(ActiveRecord::Relation)
      global_config = GlobalConfig.first
      losers = []
      winners = []

      # 先确定输家
      loser_amount.times do
        idx = rand(players.length)
        losers << players[idx]
        players.delete_at(idx)
      end

      # 确定赢家赢得金额
      total_usdt = usdt_amount * players.length
      fee = (total_usdt * global_config.fee_rate).ceil(6)
      total_usdt -= fee
      rands = []
      players.length.times do
        rands << rand
      end
      sum = rands.sum
      won_usdt = 0
      players.length.times do |i|
        win = (total_usdt * rands[i] / sum).floor(8)
        winners << {
          user: players[i],
          win: i == players.length - 1 ? total_usdt - won_usdt : win
        }
        won_usdt += win
      end

      # 输家给Candy
      losers.each do |loser|
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
      winners.each do |winner|
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
        # 直推
        if (parent = winner[:user].parent)
          reward_amount = (winners[:win] * global_config.parent_reward_rate).floor(6)
          if reward_amount > 0
            User.where(id: parent.id).update_all(['packet_usdt_available = packet_usdt_available + ?', reward_amount])
            AssetFlow.create(
              user_id: parent.id,
              asset_type: :usdt,
              flow_type: :parent_reward,
              amount: reward_amount
            )
          end

          # 间推
          if (grand = parent.parent)
            reward_amount = (winners[:win] * global_config.grand_reward_rate).floor(6)
            if reward_amount > 0
              User.where(id: grand.id).update_all(['packet_usdt_available = packet_usdt_available + ?', reward_amount])
              AssetFlow.create(
                user_id: grand.id,
                asset_type: :usdt,
                flow_type: :grand_reward,
                amount: reward_amount
              )
            end
          end
        end

        # 代理
        if (agent = (winner[:user].agent))
          reward_amount = winner[:win] * agent.agent_commission_rate
          if reward_amount > 0
            User.where(id: agent.id).update_all(['packet_usdt_available = packet_usdt_available + ?', reward_amount])
            AssetFlow.create(
              user_id: agent.id,
              asset_type: :usdt,
              flow_type: :agent_reward,
              amount: reward_amount
            )
          end
          User.where(id: agent.id).update_all(['team_usdt_flow = team_usdt_flow + ?', winner[:win]])
        end
      end

      {
        losers: losers,
        winners: winners
      }
    end
  end

  def check_win
    if waiter_amount == player_amount
      users = User.joins(:game_waiters).where(game_waiters: { game_id: id })
      result = Game.judge_winners(usdt_amount, users, loser_amount)
      GameWaiter.where(game_id: id).delete_all
      # 创建GameRound记录
      game_round = GameRound.create(game_id: id)
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

      BroadcastGameWinJob.perform_later(self, game_round)
    end
  end
end
