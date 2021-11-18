class Admin::NoticesController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:list, :create, :destroy]

  def index
  end

  def list
    data = []
    Notice.order(id: :asc).each do |notice|
      data << {
        id: notice.id,
        title: notice.title,
        language: notice.language,
        lang_name: Utils::Constants::LANGUAGE_NAMES[notice.language],
        content: notice.content,
        created_at: notice.formatted_created_at
      }
    end
    ok(rows: data, total: Notice.count)
  end

  def get
    if not (notice = Notice.find_by(id: params[:id]))
      error('该公告不存在')
    else
      success(
        id: notice.id,
        title: notice.title,
        language: notice.language,
        content: notice.content
      )
    end
  end

  def create
    notice = Notice.new(params.require(:notice).permit(:language, :title, :content))
    if notice.save
      success
    else
      error(notice.errors.full_messages[0])
    end
  end

  def update
    if not (notice = Notice.find_by(id: params[:notice][:id]))
      error('该公告不存在')
    else
      notice.attributes = params.require(:notice).permit(:language, :title, :content)
      if notice.save
        success
      else
        error(notice.errors.full_messages[0])
      end
    end
  end

  def destroy
    if not (notice = Notice.find_by(id: params[:id]))
      error('该公告不存在')
    else
      notice.destroy
      success
    end
  end
end
