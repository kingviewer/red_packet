class Admin::GamesController < Admin::BaseController
  before_action :auth_admin, only: [:index]
  before_action :ajax_auth_admin, only: [:list_for_table]
  before_action only: [:create, :update] do
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

end
