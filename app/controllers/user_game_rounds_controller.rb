class UserGameRoundsController < BaseUserController
  layout 'user'
  before_action :auth_user, only: :index
  before_action :ajax_auth_user, only: :list_my

  def index
    @title = t('.title')
  end

  def list_my
    data = []
    UserGameRound.includes(game_round: :game).where(user_id: cur_user.id).order(id: :desc).limit(params[:limit].to_i)
                 .offset(params[:limit].to_i * params[:page].to_i).each do |round|
      data << {
        id: round.id,
        usdt_amount: LZUtils.format_coin(round.usdt_frozen),
        usdt_won: LZUtils.format_coin(round.usdt_won),
        loser: round.loser,
        desc: "#{LZUtils.format_coin(round.usdt_frozen)} USDT, #{t('user_game_rounds.index.person_number', number: round.game_round.game.player_amount)}",
        packet_type: round.game_round.game_room.nil? ? t('.index.normal_packet') : t('.index.password_packet'),
        created_at: round.formatted_created_at
      }
    end
    success(data)
  end
end
