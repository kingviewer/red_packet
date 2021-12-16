class SoldierWorkCompleteJob < ApplicationJob
  queue_as :default

  def perform
    UserSoldier.working.includes(:soldier).where(expired: false).each do |us|
      us.with_lock do
        us.set_working_finished if us.working? && us.start_working_at <= Time.now - us.soldier.working_duration.minutes
      end
    end
  end
end
