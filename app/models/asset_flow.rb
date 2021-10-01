class AssetFlow < ApplicationRecord
  enum asset_type: [:usdt, :cigar]
  enum account_type: [:packet, :wallet, :welfare]
  enum flow_type: [:deposit, :withdraw, :win, :lose, :lose_reward, :parent_reward, :grand_reward]
end
