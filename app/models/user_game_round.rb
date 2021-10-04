class UserGameRound < ApplicationRecord
  belongs_to :user
  belongs_to :game_round
end
