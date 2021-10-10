class GameRoundsController < BaseUserController
  layout 'user'
  before_action :ajax_auth_user, except: :show
  before_action :auth_user, only: :show

  def show
    @title = t('.title')
    @round_id = params[:id] || 'undefined'
  end

  def list_by_room
    data = []
    GameRound.where(game_room_id: params[:game_room_id]).order(id: :desc).limit(params[:limit].to_i)
             .offset(params[:limit].to_i * params[:page].to_i).each do |round|
      ugr = UserGameRound.find_by(game_round_id: round.id, user_id: cur_user.id)
      data << {
        id: round.id,
        joined: !ugr.nil?,
        created_at: round.formatted_created_at,
        loser: ugr&.loser,
        usdt_won: !ugr.nil? && LZUtils.format_coin(ugr.usdt_won)
      }
    end
    success(data)
  end

  def info
    if not (game_round = GameRound.find_by(id: params[:id]))
      error(t('.not_exist'))
    else
      total_funds = game_round.user_game_rounds.where(loser: false).sum(:usdt_won)
      ur = game_round.user_game_rounds.find_by(user_id: cur_user.id)
      success(
        total_funds: LZUtils.format_coin(total_funds),
        joined: !ur.nil?,
        loser: ur&.loser || false,
        usdt_won: ur && LZUtils.format_coin(ur.usdt_won)
      )
    end
  end

  def all_players
    data = []
    UserGameRound.includes(:user).where(game_round_id: params[:id]).order(id: :desc).each do |ur|
      data << {
        invite_code: ur.user.invite_code,
        loser: ur.loser,
        usdt_won: LZUtils.format_coin(ur.usdt_won)
      }
    end
    success(data)
  end
end
