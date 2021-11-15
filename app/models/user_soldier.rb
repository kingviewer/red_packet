class UserSoldier < ApplicationRecord
  enum state: [:free, :working]

  belongs_to :user
  belongs_to :soldier
end
