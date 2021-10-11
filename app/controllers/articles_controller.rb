class ArticlesController < ApplicationController
  layout 'user'

  def show
    @article = Article.find_by(lang: I18n.locale, article_type: params[:article_type])
    @title = @article&.article_type_name
  end
end
