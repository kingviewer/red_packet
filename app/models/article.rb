class Article < ApplicationRecord
  enum article_type: [:guide, :reward_rule]
  enum lang: [:en, :'zh-CN', :ko]

  has_one_html :html

  def lang_name
    I18n.t("models.article.langs.#{lang}")
  end
end
