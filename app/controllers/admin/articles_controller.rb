class Admin::ArticlesController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [:list]

  def index
  end

  def list
    data = []
    Article.order(id: :asc).each do |article|
      data << {
        id: article.id,
        article_type_name: article.article_type_name,
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
        article_type: article.article_type,
        lang: article.lang,
        html: article.html
      )
    end
  end

  def create
    article = Article.new(params.require(:article).permit(:article_type, :lang))
    if Article.exists?(article_type: article.article_type, lang: article.lang)
      error('该文章已存在')
    else
      article.save
      Html.create(
        record_type: Article.name,
        record_id: article.id,
        html: params[:article][:content]
      )
      success
    end
  end

  def update
    if not (article = Article.find_by(id: params[:article][:id]))
      error('该文章不存在')
    else
      article.attributes = params.require(:article).permit(:article_type, :lang)
      if Article.where(['id != ?', article.id]).where(article_type: article.article_type, lang: article.lang).exists?
        error('该文章已存在')
      else
        article.save
        article.html_record.update(html: params[:article][:content])
        success
      end
    end
  end
end
