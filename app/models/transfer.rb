class Transfer < ApplicationRecord
  enum asset_type: [:usdt, :cigar]
  enum state: [:init, :doing, :done]

  belongs_to :user
end
