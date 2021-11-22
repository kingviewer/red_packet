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
        html: <<EOS
<style>
    #content {
        width: 100%;
        letter-spacing: 1px;
        line-height: 1.5;
    }

    #content a {
        width: inherit;
    }

    #content img {
        width: inherit !important;
        height: inherit !important;
    }

    #content p {
        width: inherit;
        letter-spacing: 1px;
        line-height: 1.5;
    }
</style>
<div id="content">
#{article.html(article.lang)}
</div>
EOS
      )
    else
      error(t('.article_not_exist'))
    end
  end
end
