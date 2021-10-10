require './config/boot'
require './config/environment'
require 'clockwork'

module TimerTask
end

module Clockwork
  handler do |job|
    puts "执行 #{job}"
  end

  every(1.minute, '同步充值') do
    # TimerTask.sync_deposits
  end
end