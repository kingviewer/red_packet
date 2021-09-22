class AssetFlow < ApplicationRecord
  enum asset_type: [:usdt, :cigar, :candy]
  enum flow_type: [:deposit, :withdraw, :win, :lose, :lose_reward, :parent_reward, :grand_reward]
end
