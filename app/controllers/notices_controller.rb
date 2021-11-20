class NoticesController < BaseUserController
  layout 'user'

  def index
    @title = '公告'
  end

  def list
    data = []
    Notice.where(language: params[:lang]).order(id: :desc).each do |notice|
      data << {
        id: notice.id,
        title: notice.title,
        content: notice.content
      }
    end
    success(data)
  end

  def last
    notice = Notice.where(language: params[:lang]).order(id: :desc).first
    success(
      id: notice&.id,
      title: notice&.title,
      content: notice&.content
    )
  end
end