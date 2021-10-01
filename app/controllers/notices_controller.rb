class NoticesController < BaseUserController
  layout 'user'

  def index
    @title = '公告'
  end

  def last
    notice = Notice.where(language: I18n.locale.to_s || 'en').order(id: :desc).first
    success(notice)
  end
end
