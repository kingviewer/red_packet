class BroadcastLeaveRoomJob < ApplicationJob
  queue_as :default

  def perform(game_room, user)
    ActionCable.server.broadcast(
      GameRoomsChannel.channel_name(game_room.id),
      action: :leave,
      id: game_room.id,
      user_id: user.id,
      address: user.encrypted_address
    )
  end
end
