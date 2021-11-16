class GamesController < BaseUserController
  layout 'user'
  before_action :ajax_auth_user, only: [:list_my_pending, :join]
  before_action :auth_user, only: :index

  def show
    @title = t('.title')
    @game = Game.find_by(id: params[:id])
  end

  # 获取全部红包列表
  def list_all
    data = []
    Game.where(on_shelf: true).order(player_amount: :asc, usdt_amount: :asc).each do |game|
      data << {
        id: game.id,
        usdt_amount: game.usdt_amount.to_i,
        player_amount: game.player_amount,
        player_amount_display: t('dashboard.index.person_losers', number: game.player_amount, bomb: game.loser_amount),
        waiter_amount: game.waiter_amount
      }
    end
    success(data)
  end

  # 首页获取我参加匹配中的红包列表
  def list_my_pending
    data = []
    GameWaiter.includes(:game).where(user_id: cur_user.id).order(id: :desc).each do |waiter|
      game = waiter.game
      data << {
        id: game.id,
        times: waiter.times,
        usdt_amount: game.usdt_amount.to_i,
        player_amount: game.player_amount,
        waiter_amount: game.waiter_amount,
        created_at: waiter.formatted_created_at
      }
    end
    success(data)
  end

  # 获取指定红包的参与者列表
  def list_waiters
    data = []
    GameWaiter.includes(:user).where(game_id: params[:id]).order(id: :desc).each do |waiter|
      data << {
        invite_code: waiter.user.invite_code,
        address: waiter.user.encrypted_address,
        created_at: waiter.formatted_created_at
      }
    end
    success(data)
  end

  # 参与
  def join
    if not (game = Game.find_by(id: params[:id], on_shelf: true))
      error(t('.game_not_exist'))
    else
      begin
        game.with_lock do
          if GameWaiter.where(user_id: cur_user.id, game_id: game.id).exists?
            error(t('.already_joined'))
          else
            User.where(id: cur_user.id).update_all(
              ['candy_available = candy_available - ?, candy_frozen = candy_frozen + ?',
               game.usdt_amount, game.usdt_amount]
            )
            cur_user.reload
            raise t('game_rooms.join.cic_available_insufficient') if cur_user.candy_available < 0
            waiter = GameWaiter.create(
              user_id: cur_user.id,
              game_id: game.id,
              times: game.times
            )
            Game.where(id: game.id).update_all('waiter_amount = waiter_amount + 1')
            game.reload
            BroadcastJoinGameJob.perform_later(game, game.waiter_amount, cur_user)
            game_round_id = game.check_win
            success(
              id: game.id,
              player_amount: game.player_amount,
              waiter_amount: game.waiter_amount,
              usdt_amount: game.usdt_amount.to_i,
              created_at: waiter.formatted_created_at,
              win: !game_round_id.nil?,
              game_round_id: game_round_id,
              times: game.times
            )
          end
        end
      rescue => e
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
        error(e.message)
      end
    end
  end

  def info
    if not (game = Game.find_by(id: params[:id]))
      error(t('.join.game_not_exist'))
    else
      success(
        player_amount: game.player_amount,
        loser_amount: game.loser_amount,
        usdt_amount: LZUtils.format_coin(game.usdt_amount),
        person_number: "#{game.waiter_amount}/#{game.player_amount} #{t('user_game_rounds.index.person_number')}",
        progress: "#{(game.waiter_amount * 100 / game.player_amount).to_i}%",
        i_joined: !cur_user.nil? && GameWaiter.where(game_id: game.id, user_id: cur_user.id).exists?
      )
    end
  end
end
