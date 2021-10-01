class Transfer < ApplicationRecord
  enum asset_type: [:usdt, :cigar]
  enum state: [:init, :doing, :done]
end
