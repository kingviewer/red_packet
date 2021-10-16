class SysAccount < ApplicationRecord
  enum account_type: [
    :back_fund, :token_fund, :income, :vip_usdt, :vip_cic, :agent_usdt, :agent_cic, :exchange_usdt, :exchange_cic
  ]

  def account_type_name
    if back_fund?
      '回购基金'
    elsif token_fund?
      '代币基金'
    elsif income?
      '红包收入'
    elsif vip_usdt?
      '教官收入(USDT)'
    elsif vip_cic?
      '教官收入(BOMB)'
    elsif agent_usdt?
      '总教官收入(USDT)'
    elsif agent_cic?
      '总教官收入(BOMB)'
    elsif exchange_usdt?
      '兑换收入(USDT)'
    elsif exchange_cic?
      '兑换支出(CIC)'
    else
      '-'
    end
  end

  def asset_symbol
    if back_fund? || token_fund? || income? || vip_usdt? || agent_usdt? || exchange_usdt?
      'USDT'
    elsif vip_cic? || agent_cic? || exchange_cic?
      'BOMB'
    else
      '-'
    end
  end
end
