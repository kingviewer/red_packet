class BroadcastJoinGameJob < ApplicationJob
  queue_as :default

  def perform(game, user)
    ActionCable.server.broadcast(
      GamesChannel.channel_name(game.id),
      action: :join,
      id: game.id,
      user_id: user.id,
      invite_code: user.invite_code,
      address: user.encrypted_address,
      time: LZUtils.format_time(Time.now)
    )
  end
end
