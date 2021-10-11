class Admin::ImagesController < Admin::BaseController
  layout false
  before_action :ajax_auth_admin, only: [:destroy]

  def index
    @func_num = params[:CKEditorFuncNum]
  end

  def list
    data = []
    Image.where(deleted: false).order(id: :desc).each do |img|
      data << {
        id: img.id,
        file_name: img.file_name,
        image: image_path(id: img.id)
      }
    end
    success(data)
  end

  def create
    if params[:from_browser]
      image = Image.create(image: params[:image], file_name: params[:image].original_filename)
      success(
        id: image.id,
        file_name: image.file_name,
        image: image_path(id: image.id)
      )
    else
      # CKEditor拖拽形式上传图片
      image = Image.create(image: params[:upload], file_name: params[:upload].original_filename)
      ok(
        uploaded: 1,
        fileName: image.image.filename,
        url: image_path(id: image.id)
      )
    end
  end

  def destroy
    if not (image = Image.find_by(id: params[:id]))
      error('图片不存在')
    else
      image.update(deleted: true)
      success
    end
  end

  private

  def image_path(id:)
    "/images/show?id=#{id}"
  end
end
