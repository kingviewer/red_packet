class GamesController < BaseUserController
  layout 'user'
  before_action :ajax_auth_user, except: :index
  before_action :auth_user, only: :index

  def show
    @title = t('.title')
    @game = Game.find_by(id: params[:id])
  end

  # 获取全部红包列表
  def list_all
    data = []
    Game.order(usdt_amount: :asc).each do |game|
      data << {
        id: game.id,
        usdt_amount: game.usdt_amount.to_i,
        player_amount: game.player_amount,
        player_amount_display: t('dashboard.index.person', number: game.player_amount),
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
        id: waiter.game.id,
        usdt_amount: waiter.game.usdt_amount,
        player_amount: waiter.game.player_amount,
        player_amount_display: t('dashboard.index.person', number: waiter.game.player_amount),
        waiter_amount: waiter.game.waiter_amount,
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
            waiter = GameWaiter.create(
              user_id: cur_user.id,
              game_id: game.id
            )
            Game.where(id: game.id).update_all('waiter_amount = waiter_amount + 1')
            BroadcastJoinGameJob.perform_later(game, cur_user)
            game.reload
            game.check_win
            success(
              id: game.id,
              usdt_amount: game.usdt_amount,
              player_amount: game.player_amount,
              player_amount_display: t('dashboard.index.person', number: game.player_amount),
              waiter_amount: game.waiter_amount,
              created_at: waiter.formatted_created_at
            )
          end
        end
      rescue => e
        error(e.message)
      end
    end
  end
end
