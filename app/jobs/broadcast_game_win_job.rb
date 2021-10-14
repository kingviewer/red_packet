class BroadcastGameWinJob < ApplicationJob
  queue_as :default

  def perform(game, times, game_round)
    ActionCable.server.broadcast(
      GamesChannel.channel_name(game.id),
      id: game.id,
      times: times,
      game_round_id: game_round.id,
      action: :win
    )
  end
end
