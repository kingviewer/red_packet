class Admin::ScrollTextsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:set_en, :set_zh]

  def index
    @scroll_text_en = ScrollText.where(lang: :en).first
    @scroll_text_cn = ScrollText.where(lang: 'zh-CN').first
  end

  def set_zh
    text = ScrollText.find_by(lang: 'zh-CN') || ScrollText.create(lang: 'zh-CN')
    text.update(content: params[:content])
    success
  end

  def set_en
    text = ScrollText.find_by(lang: :en) || ScrollText.create(lang: :en)
    text.update(content: params[:content])
    success
  end
end
