class GameRoundsController < BaseUserController
  layout 'user'
  before_action :ajax_auth_user, except: [:show]
  # before_action :auth_user, only: [:show]

  def show
    @title = '开奖结果'
  end
end
