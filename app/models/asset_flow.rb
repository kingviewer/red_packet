class AssetFlow < ApplicationRecord
  enum asset_type: [:usdt, :cigar]
  enum account_type: [:packet, :wallet]
  enum flow_type: [
    :deposit, :withdraw, :transfer, :win, :lose, :lose_reward, :parent_reward, :grand_reward, :buy_agent, :buy_vip,
    :team_new_agent, :team_new_vip
  ]

  def flow_type_name
    I18n.t("models.asset_flow.flow_types.#{flow_type}")
  end
end
