class Bomb < ApplicationRecord
  belongs_to :user
  belongs_to :soldier
end
