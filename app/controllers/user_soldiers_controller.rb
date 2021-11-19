class UserSoldiersController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    relation = cur_user.user_soldiers.includes(:soldier).where(expired: false)
    relation = relation.where(state: params[:state]) unless params[:state].blank?
    relation.order(id: :desc).each do |us|
      data << {
        id: us.id,
        level: us.soldier.level,
        amount: us.amount,
        left_duration: us.left_duration,
        contribution: us.soldier.contribution,
        start_working_at: LZUtils.format_datetime(us.start_working_at),
        left_secs: us.working? ? (us.start_working_at.since(Utils::Constants::SOLDIER_WORKING_TIME.minutes) - Time.now).to_i : 0,
        power: us.soldier.power,
        image: us.soldier.image.service_url,
        state: us.state
      }
    end
    success(data)
  end

  def start_working
    if not (us = UserSoldier.find_by(id: params[:id], user_id: cur_user.id, expired: false))
      error(t('soldiers.buy.soldier_not_exist'))
    elsif us.start_working_at && us.start_working_at >= Time.now.beginning_of_day
      error(t('.today_has_worked'))
    else
      us.with_lock do
        if us.working?
          error(t('.soldier_already_working'))
        else
          us.update(start_working_at: Time.now, state: :working)
          success
        end
      end
    end
  end
end
