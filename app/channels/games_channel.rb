class GamesChannel < ApplicationCable::Channel
  class << self
    def channel_name(game_id)
      "game_#{game_id}"
    end
  end

  def subscribed
    if Game.exists?(id: params[:game_id])
      stream_from(GamesChannel.channel_name(params[:game_id]))
    else
      reject_subscription
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
