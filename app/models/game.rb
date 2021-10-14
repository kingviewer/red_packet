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
      total_usdt = usdt_amount * loser_amount
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
        candy_amount = (usdt_amount * 0.01 / global_config.cigar_usdt_price).floor(6)
        User.where(id: loser.id).update_all(
          ['packet_usdt_frozen = packet_usdt_frozen - ?, candy_available = candy_available + ?', usdt_amount,
           candy_amount]
        )
        AssetFlow.create(
          user_id: loser.id,
          account_type: :packet,
          asset_type: :usdt,
          flow_type: :lose,
          amount: -usdt_amount
        )
        AssetFlow.create(
          user_id: loser.id,
          account_type: :packet,
          asset_type: :cigar,
          flow_type: :lose_reward,
          amount: candy_amount
        )
      end

      # 赢家给USDT
      total_fee_left = 0
      winners.each do |winner|
        User.where(id: winner[:user].id).update_all(
          ['packet_usdt_available = packet_usdt_available + ?, packet_usdt_frozen = packet_usdt_frozen - ?',
           usdt_amount + winner[:win], usdt_amount]
        )
        AssetFlow.create(
          user_id: winner[:user].id,
          account_type: :packet,
          asset_type: :usdt,
          flow_type: :win,
          amount: winner[:win]
        )

        # 代理返佣
        fee -= winner[:user].reward_flow(winner[:win])

        # 直推
        if (parent = winner[:user].parent)
          if parent.vip? || parent.agent?
            reward_amount = (winner[:win] * global_config.parent_reward_rate).floor(6)
            if reward_amount > 0
              User.where(id: parent.id).update_all(['packet_usdt_available = packet_usdt_available + ?', reward_amount])
              AssetFlow.create(
                user_id: parent.id,
                asset_type: :usdt,
                account_type: :packet,
                flow_type: :parent_reward,
                amount: reward_amount
              )
              fee -= reward_amount
            end
          end

          # 间推
          if (grand = parent.parent)
            if grand.vip? || grand.agent?
              reward_amount = (winner[:win] * global_config.grand_reward_rate).floor(6)
              if reward_amount > 0
                User.where(id: grand.id).update_all(['packet_usdt_available = packet_usdt_available + ?', reward_amount])
                AssetFlow.create(
                  user_id: grand.id,
                  account_type: :packet,
                  asset_type: :usdt,
                  flow_type: :grand_reward,
                  amount: reward_amount
                )
                fee -= reward_amount
              end
            end
          end
        end

        total_fee_left += fee
      end

      # 系统账户增加金额
      back_fund = (total_fee_left * 0.1).floor(8)
      SysAccount.back_fund.update_all(['balance = balance + ?, total = total + ?', back_fund, back_fund])
      SysFlow.create(
        sys_account_id: SysAccount.back_fund.first.id,
        flow_type: :new_round,
        amount: back_fund
      )
      token_fund = back_fund
      SysAccount.token_fund.update_all(['balance = balance + ?, total = total + ?', token_fund, token_fund])
      SysFlow.create(
        sys_account_id: SysAccount.token_fund.first.id,
        flow_type: :new_round,
        amount: token_fund
      )
      sys_benefit = total_fee_left - back_fund - token_fund
      SysAccount.income.update_all(['balance = balance + ?, total = total + ?', sys_benefit, sys_benefit])
      SysFlow.create(
        sys_account_id: SysAccount.income.first.id,
        flow_type: :new_round,
        amount: sys_benefit
      )

      # 加流水
      winners.each do |winner|
        winner[:user].add_team_flow(winner[:win])
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
      update(waiter_amount: 0, times: times + 1)
      game_round.id
    end
  end
end
