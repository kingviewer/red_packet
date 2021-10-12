class SysFlow < ApplicationRecord
  enum flow_type: [:new_round, :new_vip, :new_agent, :bg_decrease]

  def flow_type_name
    if new_round?
      '游戏结算'
    elsif new_vip?
      '升级教官'
    elsif new_agent?
      '升级总教官'
    elsif bg_decrease?
      '后台扣除'
    else
      '-'
    end
  end
end
