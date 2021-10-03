class BroadcastRoomWinJob < ApplicationJob
  queue_as :default

  def perform(game_room, game_round)
    ActionCable.server.broadcast(
      GameRoomsChannel.channel_name(game_room.id),
      action: :win,
      game_round_id: game_round.id
    )
  end
end
