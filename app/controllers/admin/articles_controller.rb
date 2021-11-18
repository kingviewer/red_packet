class Admin::ArticlesController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:list, :create, :destroy]

  def index
  end

  def list
    data = []
    Article.order(id: :asc).each do |article|
      data << {
        id: article.id,
        title: article.title,
        lang_name: article.lang_name,
        created_at: article.formatted_created_at
      }
    end
    ok(rows: data, total: Article.count)
  end

  def get
    if not (article = Article.find_by(id: params[:id]))
      error('该文章不存在')
    else
      success(
        id: article.id,
        title: article.title,
        lang: article.lang,
        html: article.html(article.lang)
      )
    end
  end

  def create
    article = Article.new(params.require(:article).permit(:lang, :title))
    article.save
    article.set_html(params[:article][:content], article.lang)
    success
  end

  def update
    if not (article = Article.find_by(id: params[:article][:id]))
      error('该文章不存在')
    else
      article.attributes = params.require(:article).permit(:lang, :title)
      article.save
      article.set_html(params[:article][:content], article.lang)
      success
    end
  end

  def destroy
    if not (article = Article.find_by(id: params[:id]))
      error('该文章不存在')
    else
      article.destroy
      success
    end
  end
end
