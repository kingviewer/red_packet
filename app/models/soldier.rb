class Soldier < ApplicationRecord
  has_one_localize :level
  has_one_attached :image
end
