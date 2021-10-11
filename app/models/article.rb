class Article < ApplicationRecord
  enum article_type: [:guide, :reward_rule]
  enum lang: [:en, :'zh-CN', :ko]

  def html
    html_record&.html
  end

  def html_record
    Html.find_by(record_type: Article.name, record_id: id)
  end

  def article_type_name
    I18n.t("models.article.article_types.#{article_type}")
  end

  def lang_name
    I18n.t("models.article.langs.#{lang}")
  end
end
