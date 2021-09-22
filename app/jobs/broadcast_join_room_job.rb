class BroadcastJoinRoomJob < ApplicationJob
  queue_as :default

  def perform(game_room, user)
    ActionCable.server.broadcast(
      GameRoomsChannel.channel_name(game_room.id),
      action: :join,
      id: game_room.id,
      user_id: user.id,
      address: user.encrypted_address
    )
  end
end
