class UserGameRoundsController < BaseUserController
  layout 'user'

  def index
    @title = '参与记录'
  end
end
