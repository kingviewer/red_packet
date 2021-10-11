class ImagesController < ApplicationController
  def show
    if (image = Image.find_by(id: params[:id]))
      redirect_to image.image.service_url
    end
  end
end
