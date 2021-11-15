class Admin::GlobalConfigsController < Admin::BaseController
  def languages
    items = []
    Utils::Constants::LANGUAGES.each do |lang|
      items << {
        lang: lang,
        name: Utils::Constants::LANGUAGE_NAMES[lang]
      }
    end
    success(items)
  end
end
