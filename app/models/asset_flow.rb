class AssetFlow < ApplicationRecord
  enum asset_type: [:usdt, :cigar]
  enum account_type: [:packet, :wallet]
  enum flow_type: [
    :deposit, :withdraw, :transfer, :win, :lose, :lose_reward, :parent_reward, :grand_reward, :agent_reward, :buy_agent, :buy_vip,
    :team_new_agent, :team_new_vip, :vip_init_reward, :agent_init_reward, :exchange_cic, :air_drop, :buy_soldier
  ]

  belongs_to :user

  def flow_type_name
    I18n.t("models.asset_flow.flow_types.#{flow_type}")
  end

  def asset_type_name
    if usdt?
      'USDT'
    elsif cigar?
      'BOMB'
    else
      '-'
    end
  end

  def account_type_name
    if packet?
      I18n.t('utils.accounts.packet')
    elsif wallet?
      I18n.t('utils.accounts.wallet')
    else
      '-'
    end
  end
end
