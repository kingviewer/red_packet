class GamesController < BaseUserController
  before_action :ajax_auth_user

  # 获取全部红包列表
  def list_all
    data = []
    Game.order(usdt_amount: :asc).each do |game|
      data << {
        id: game.id,
        usdt_amount: game.usdt_amount,
        player_amount: game.player_amount,
        waiter_amount: game.waiter_amount
      }
    end
    success(data)
  end

  # 首页获取我参加匹配中的红包列表
  def list_my_pending
    data = []
    GameWaiter.includes(:game).where(user_id: cur_session.user_id).order(id: :desc).each do |waiter|
      data << {
        id: waiter.id,
        usdt_amount: game.usdt_amount,
        player_amount: game.player_amount,
        waiter_amount: game.waiter_amount
      }
    end
    success(data)
  end

  # 参与
  def join
    if not (game = Game.find_by(id: params[:id]))
      error(t('.game_not_exist'))
    else
      begin
        game.with_lock do
          if GameWaiter.where(user_id: cur_user.id, game_id: game.id).exists?
            error('.already_joined')
          else
            User.where(id: cur_user.id).update_all(
              ['packet_usdt_available = packet_usdt_available - ?, packet_usdt_frozen = packet_usdt_frozen + ?',
               game.usdt_amount, game.usdt_amount]
            )
            cur_user.reload
            raise t('game_rooms.join.usdt_available_insufficient') if cur_user.packet_usdt_available < 0
            GameWaiter.create(
              user_id: cur_user.id,
              game_id: game.id
            )
            Game.where(id: game.id).update_all('waiter_amount = waiter_amount + 1')
            BroadcastJoinGameJob.perform_later(game, cur_user)
            game.check_win
            success
          end
        end
      rescue => e
        error(e.message)
      end
    end
  end
end
