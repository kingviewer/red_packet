class ScrollTextsController < ApplicationController
  def get
    text = ScrollText.find_by(lang: params[:lang] || 'en')
    success(
      content: text&.content
    )
  end
end
