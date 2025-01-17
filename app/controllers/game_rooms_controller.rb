class GameRoomsController < BaseUserController
  layout 'user'
  before_action :ajax_auth_user, except: [:show]
  before_action :auth_user, only: [:show]

  def show
    @title = t('dashboard.index.encrypted_packet')
    @room_id = GameRoom.find_by(id: params[:id].to_i)&.id
  end

  # 创建
  def create
    game_room = GameRoom.new(params.permit(:usdt_amount, :player_amount, :min_usdt_amount, :password))
    game_room.loser_amount = game_room.player_amount - params[:winner_amount].to_i
    if game_room.usdt_amount <= 0 || game_room.player_amount <= 0 || game_room.loser_amount <= 0
      invalid_params
    elsif game_room.usdt_amount % 10 != 0
      error(t('.cic_amount_invalid'))
    elsif game_room.min_usdt_amount < game_room.usdt_amount
      error(t('.min_usdt_amount_less_than_game_required'))
    elsif game_room.loser_amount >= game_room.player_amount || game_room.loser_amount < 1
      error(t('.loser_amount_lager_than_player_amount'))
    else
      begin
        cur_user.with_lock do
          if UserRoom.where(user_id: cur_user.id).exists?
            error(t('.in_room_not_to_create'))
          else
            User.where(id: cur_user.id).update_all(
              ['candy_available = candy_available - ?, candy_frozen = candy_frozen + ?',
               game_room.usdt_amount, game_room.usdt_amount]
            )
            cur_user.reload
            if cur_user.candy_available < game_room.min_usdt_amount
              raise t('.usdt_available_less_than_min')
            else
              game_room.user_id = cur_user.id
              game_room.save!
              UserRoom.create(user_id: cur_user.id, game_room_id: game_room.id, joined: true)
              success(
                id: game_room.id,
                usdt_amount: game_room.usdt_amount,
                player_amount: game_room.player_amount,
                loser_amount: game_room.loser_amount,
                min_usdt_amount: game_room.min_usdt_amount
              )
            end
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
      joiner_amount = UserRoom.where(game_room_id: game_room.id, joined: true).count
      success(
        id: game_room.id,
        usdt_amount: game_room.usdt_amount.to_i,
        player_amount: game_room.player_amount,
        loser_amount: game_room.loser_amount,
        min_usdt_amount: game_room.min_usdt_amount,
        joiner_amount: joiner_amount,
        progress: (joiner_amount * 100 / game_room.player_amount).to_i,
        player_amount_display: "#{joiner_amount}/#{game_room.player_amount} #{t('user_game_rounds.index.person_number')}",
        joined: !ur.nil? && ur.joined
      )
    else
      error(t('.room_not_exist'))
    end
  end

  # ID和密码查找
  def search
    if not (game_room = GameRoom.playing.find_by(id: params[:id].to_i, password: params[:password]))
      error(t('.room_not_exist'))
    elsif cur_user.candy_available < game_room.min_usdt_amount
      error(t('.join.cic_available_insufficient'))
    else
      success(id: game_room.id)
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
    elsif UserRoom.exists?(user_id: cur_user.id, game_room_id: game_room.id)
      error(t('.have_joined_the_room'))
    else
      game_room.with_lock do
        if game_room.stopped?
          error(t('.room_stopped'))
        elsif UserRoom.exists?(user_id: cur_user.id, game_room_id: game_room.id)
          error(t('.have_joined_the_room'))
        else
          user_room = UserRoom.create(user_id: cur_user.id, game_room_id: game_room.id, joined: true)
          User.where(id: cur_user.id).update_all(
            ['candy_available = candy_available - ?, candy_frozen = candy_frozen + ?',
             game_room.usdt_amount, game_room.usdt_amount]
          )
          cur_user.reload
          raise t('.cic_available_insufficient') if cur_user.packet_usdt_available < 0
          BroadcastJoinRoomJob.perform_later(game_room, cur_user)
          game_round_id = game_room.check_win
          success(win: !game_round_id.nil?, time: user_room.formatted_updated_at, game_round_id: game_round_id)
        end
      end
    end
  end

  # 离开
  def leave
    if not (game_room = GameRoom.playing.find_by(id: params[:id]))
      success
    elsif not (user_room = UserRoom.find_by(user_id: cur_user.id, game_room_id: game_room.id))
      invalid_request
    else
      game_room.with_lock do
        user_room.reload
        if user_room.destroyed?
          success
        else
          User.where(id: cur_user.id).update_all(
            ['candy_available = candy_available + ?, candy_frozen = candy_frozen - ?',
             game_room.usdt_amount, game_room.usdt_amount]
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

  def list_users
    data = []
    UserRoom.includes(:user).where(game_room_id: params[:id]).order(joined: :desc).order(id: :desc).each do |ur|
      data << {
        invite_code: ur.user.invite_code,
        created_at: ur.formatted_updated_at
      }
    end
    success(data)
  end

  # Returns if the user has entered a room and if true, the id of the room
  def entered_room
    ur = UserRoom.find_by(user_id: cur_user.id)
    success(
      entered: !ur.nil?,
      game_room_id: ur&.game_room_id
    )
  end
end
