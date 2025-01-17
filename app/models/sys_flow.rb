class SysFlow < ApplicationRecord
  enum flow_type: [:new_round, :new_vip, :new_agent, :bg_decrease, :exchange]

  belongs_to :sys_account
  belongs_to :admin, required: false

  def flow_type_name
    if new_round?
      '游戏结算'
    elsif new_vip?
      '升级教官'
    elsif new_agent?
      '升级总教官'
    elsif bg_decrease?
      '后台扣除'
    elsif exchange?
      '兑换'
    else
      '-'
    end
  end
end
