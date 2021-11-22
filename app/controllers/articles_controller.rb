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
      html = article.html(article.lang).gsub('<p', '<p style="width: inherit; letter-spacing: 1px; line-height: 1.5;" ')
                    .gsub('<a', '<a style="width: inherit !important; height: inherit !important;" ')
                    .gsub('<img', '<img style="width: inherit !important;height: inherit !important;" ')
      success(
        id: article.id,
        title: article.title,
        html: <<EOS
<div style="width: 100%;">
#{html}
</div>
EOS
      )
    else
      error(t('.article_not_exist'))
    end
  end
end
