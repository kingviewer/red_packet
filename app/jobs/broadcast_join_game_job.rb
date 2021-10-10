class BroadcastJoinGameJob < ApplicationJob
  queue_as :default

  def perform(game, user)
    ActionCable.server.broadcast(
      GamesChannel.channel_name(game.id),
      action: :join,
      id: game.id,
      user_id: user.id,
      progress: (game.waiter_amount * 100 / game.player_amount).to_i,
      invite_code: user.invite_code,
      address: user.encrypted_address,
      time: LZUtils.format_datetime(Time.now)
    )
  end
end
