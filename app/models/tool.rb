class Tool < ApplicationRecord
  has_one_localize :name
  has_one_attached :image
end
