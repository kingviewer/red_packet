class GameRound < ApplicationRecord
  belongs_to :game
  belongs_to :game_room, required: false
end
