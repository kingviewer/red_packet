class SoldierWorkCompleteJob < ApplicationJob
  queue_as :default

  def perform
    start_working_time = Time.now.ago(Utils::Constants::SOLDIER_WORKING_TIME.minutes)
    UserSoldier.where(state: :working, expired: false).where(['start_working_at <= ?', start_working_time]).each do |us|
      us.with_lock do
        us.set_working_finished if us.working?
      end
    end
  end
end
