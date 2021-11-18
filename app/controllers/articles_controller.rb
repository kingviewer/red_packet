class ArticlesController < ApplicationController
  layout 'user'

  def list
    data = []
    Article.where(lang: params[:lang]).order(id: :desc).each do |article|
      data << {
        id: article.id,
        title: article.title
      }
    end
    success(data)
  end

  def detail
    if (article = Article.find_by(id: params[:id]))
      success(
        id: article.id,
        title: article.title,
        html: article.html(article.lang)
      )
    else
      error(t('.article_not_exist'))
    end
  end
end
