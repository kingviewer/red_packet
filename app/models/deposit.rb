class Deposit < ApplicationRecord
  enum state: [:under_check, :under_confirm, :confirmed, :fake]
end
