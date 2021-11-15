require './config/boot'
require './config/environment'
require 'clockwork'

module TimerTask
  def self.finish_soldier_working
    SoldierWorkCompleteJob.perform_later
  end
end

module Clockwork
  handler do |job|
    puts "执行 #{job}"
  end

  every(1.minute, '检查工兵工作结束') do
    TimerTask.finish_soldier_working
  end
end