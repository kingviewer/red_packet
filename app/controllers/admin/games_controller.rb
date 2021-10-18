class Admin::GamesController < Admin::BaseController
  before_action :auth_admin, only: [:index]
  before_action :ajax_auth_admin, only: [:list_for_table]
  before_action only: [:create, :update, :set_on_shelf, :set_off_shelf] do
    ajax_auth_admin('admin')
  end

  def index
  end

  def list_for_table
    data = []
    Game.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |game|
      data << {
        id: game.id,
        usdt_amount: game.usdt_amount,
        player_amount: game.player_amount,
        loser_amount: game.loser_amount,
        on_shelf: game.on_shelf,
        created_at: game.formatted_created_at
      }
    end
    ok(total: Game.count, rows: data)
  end

  def create
    game = Game.new(params.require(:game).permit(:usdt_amount, :player_amount, :loser_amount))
    if game.loser_amount >= game.player_amount
      error('输家数量应小于等于玩家数量')
    elsif not game.save
      error(game.errors.full_messages[0])
    else
      success
    end
  end

  def update
    if not (game = Game.find_by(id: params[:game][:id]))
      error('游戏不存在')
    else
      game.attributes = params.require(:game).permit(:usdt_amount, :player_amount, :loser_amount)
      if not game.save
        error(game.errors.full_messages[0])
      else
        success
      end
    end
  end

  def set_on_shelf
    if not (game = Game.find_by(id: params[:id]))
      error('游戏不存在')
    elsif game.on_shelf
      error('该游戏已经上架')
    else
      game.update(on_shelf: true)
      success
    end
  end

  def set_off_shelf
    if not (game = Game.find_by(id: params[:id]))
      error('游戏不存在')
    elsif not game.on_shelf
      error('该游戏已经下架')
    else
      game.with_lock do
        if not game.on_shelf
          error('该游戏已经下架')
        else
          game.game_waiters.each do |waiter|
            User.where(id: waiter.user_id).update_all(
              ['packet_usdt_available = packet_usdt_available + ?, packet_usdt_frozen = packet_usdt_frozen - ?',
               game.usdt_amount, game.usdt_amount]
            )
            waiter.destroy
          end
          game.update(waiter_amount: 0, on_shelf: false)
          success
        end
      end
    end
  end

end
