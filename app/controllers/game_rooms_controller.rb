class GameRoomsController < BaseUserController
  before_action :ajax_auth_user

  # 创建
  def create
    game_room = GameRoom.new(params.require(:game_room).permit(:game_id, :min_usdt_amount, :password, :loser_amount))
    if not (game = Game.find_by(id: game_room.game_id))
      error(t('.game_not_exist'))
    elsif game.min_usdt_amount < game.usdt_amount
      error(t('.min_usdt_amount_less_than_game_required'))
    elsif game_room.loser_amount >= game.player_amount
      error(t('.loser_amount_lager_than_player_amount'))
    else
      begin
        cur_user.with_lock do
          if UserRoom.where(user_id: cur_session.user_id).exists?
            error('.in_room_not_to_create')
          elsif cur_user.packet_usdt_available < game_room.min_usdt_amount
            error('.usdt_available_less_than_min')
          else
            game_room.user_id = cur_user.id
            game_room.save!
            UserRoom.create(user_id: cur_user.id, game_room_id: game_room.id)
            success(
              id: game_room.id,
              usdt_amount: game.usdt_amount,
              player_amount: game.player_amount,
              loser_amount: game_room.loser_amount,
              min_usdt_amount: game_room.min_usdt_amount
            )
          end
        end
      rescue => e
        error(e.message)
      end
    end
  end

  # 查找
  def query
    if (game_room = GameRoom.playing.find_by(id: params[:id]))
      ur = UserRoom.find_by(game_room_id: game_room.id, user_id: cur_user.id)
      success(
        id: game_room.id,
        usdt_amount: game.usdt_amount,
        player_amount: game.player_amount,
        loser_amount: game_room.loser_amount,
        min_usdt_amount: game_room.min_usdt_amount,
        user_amount: UserRoom.where(game_room_id: game_room.id).count,
        joiner_amount: UserRoom.where(game_room_id: game_room.id, joined: true).count,
        entered: !ur.nil,
        joined: !ur.nil? && ur.joined
      )
    else
      error(t('.room_not_exist'))
    end
  end

  # 进入
  def enter
    if not (game_room = GameRoom.playing.find_by(id: params[:id]))
      error(t('.query.room_not_exist'))
    else
      game_room.with_lock do
        if UserRoom.exists?(user_id: cur_user.id, game_room_id: game_room.id)
          success
        elsif UserRoom.where(user_id: cur_user.id).count > 0
          error(t('.have_joined_a_room'))
        else
          UserRoom.create(user_id: cur_user.id, game_room_id: game_room.id)
          BroadcastEnterRoomJob.perform_later(game_room, cur_user)
          success
        end
      end
    end
  end

  # 参与
  def join
    if not (game_room = GameRoom.playing.find_by(id: params[:id]))
      error(t('.query.room_not_exist'))
    elsif not (user_room = UserRoom.find_by(user_id: cur_user.id, game_room_id: game_room.id))
      invalid_request
    else
      game_room.with_lock do
        user_room.reload
        if game_room.stopped?
          error(t('.room_stopped'))
        elsif user_room.joined
          error(t('.have_joined_the_room'))
        else
          User.where(id: cur_user.id).update_all(
            ['packet_usdt_available = packet_usdt_available - ?, packet_usdt_frozen = packet_usdt_frozen + ?',
             game_room.game.usdt_amount, game_room.game.usdt_amount]
          )
          cur_user.reload
          raise t('.usdt_available_insufficient') if cur_user.packet_usdt_available < 0
          user_room.update(joined: true)
          BroadcastJoinRoomJob.perform_later(game_room, cur_user)
          game_room.check_win
          success
        end
      end
    end
  end

  # 离开
  def leave
    if not (game_room = GameRoom.playing.find_by(id: params[:id]))
      error(t('.query.room_not_exist'))
    elsif not (user_room = UserRoom.find_by(user_id: cur_user.id, game_room_id: game_room.id))
      invalid_request
    else
      game_room.with_lock do
        user_room.reload
        if user_room.destroyed?
          success
        else
          User.where(id: cur_user.id).update_all(
            ['packet_usdt_available = packet_usdt_available + ?, packet_usdt_frozen = packet_usdt_frozen - ?',
             game_room.game.usdt_amount, game_room.game.usdt_amount]
          ) if user_room.joined
          user_room.destroy
          if UserRoom.where(game_room_id: game_room.id).count == 0
            game_room.stopped!
          else
            BroadcastLeaveRoomJob.perform_later(game_room, cur_user)
          end
          success
        end
      end
    end
  end

end
