class GameRoomsChannel < ApplicationCable::Channel
  class << self
    def channel_name(game_room_id)
      "game_room_#{game_room_id}"
    end
  end

  def subscribed
    if GameRoom.playing.exists?(id: params[:game_room_id])
      stream_for(GameRoomsChannel.channel_name(params[:game_room_id]))
    else
      reject_subscription
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
