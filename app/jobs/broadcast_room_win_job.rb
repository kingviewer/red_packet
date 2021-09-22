class BroadcastRoomWinJob < ApplicationJob
  queue_as :default

  def perform(game_room, winners)
    win_list = []
    winners.each do |item|
      user = item[:user]
      win_list << {
        user_id: user.id,
        address: user.encrypted_address,
        win: item[:win]
      }
    end
    ActionCable.server.broadcast(
      GameRoomsChannel.channel_name(game_room.id),
      action: :win,
      winners: win_list
    )
  end
end
