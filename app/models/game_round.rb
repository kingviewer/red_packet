class GameRound < ApplicationRecord
  belongs_to :game, required: false
  belongs_to :game_room, required: false
  has_many :user_game_rounds
end
