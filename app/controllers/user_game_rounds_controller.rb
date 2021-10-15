class UserGameRoundsController < BaseUserController
  layout 'user'
  before_action :auth_user, only: :index
  before_action :ajax_auth_user, only: :list_my

  def index
    @title = t('.title')
  end

  def list_my
    data = []
    relation = UserGameRound.includes(game_round: :game).joins(:game_round).where(user_id: cur_user.id)
    relation = relation.where(game_rounds: { game_room_id: nil }) if params[:only_normal]
    relation.order(id: :desc).limit(params[:limit].to_i)
                 .offset(params[:limit].to_i * params[:page].to_i).each do |round|
      data << {
        id: round.id,
        usdt_amount: LZUtils.format_coin(round.usdt_frozen),
        usdt_won: LZUtils.format_coin(round.usdt_won),
        loser: round.loser,
        desc: "#{round.usdt_frozen.to_i} USDT, #{round.game_round.game&.player_amount || round.game_round.game_room&.player_amount} #{t('user_game_rounds.index.person_number')}",
        packet_type: round.game_round.game_room.nil? ? t('.index.normal_packet') : t('.index.password_packet'),
        game_round_id: round.game_round_id,
        created_at: round.formatted_created_at
      }
    end
    success(data)
  end
end
