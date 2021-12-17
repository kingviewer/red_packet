class Soldier < ApplicationRecord
  has_one_localize :level
  has_one_attached :image
  has_one_attached :bomb_image

  def max_working_times
    day_working_times * duration
  end
end
