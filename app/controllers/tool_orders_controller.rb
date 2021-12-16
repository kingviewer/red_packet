class ToolOrdersController < BaseUserController
  before_action :ajax_auth_user, only: :list_my

  def list_my
    data = []
    ToolOrder.includes(:tool).where(user_id: cur_user.id).
      limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |order|
      data << {
        id: order.id,
        price: LZUtils.format_coin(order.price),
        tool_name: order.tool.name,
        tool_image: order.tool.image.service_url,
        amount: order.amount,
        created_at: order.formatted_created_at
      }
    end
    success(data)
  end
end

{
  "code": "success",
  "data": [
    {
      "id": 1,
      "price": "150.000000",
      "tool_name": "道具2",
      "tool_image": "https://bombgame.s3.us-west-1.amazonaws.com/nbcfzslsncz2qspb8qcfjx6a222n?response-content-disposition=inline%3B%20filename%3D%22icon-bank.png%22%3B%20filename%2A%3DUTF-8%27%27icon-bank.png&response-content-type=image%2Fpng&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT7VBGJ6WEAZAHZXR%2F20211216%2Fus-west-1%2Fs3%2Faws4_request&X-Amz-Date=20211216T065458Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=b9053cae381e5ca1210ba7ee4670dba6091ab210ef620a5975f8d5cb77b88ad8",
      "amount": 2,
      "created_at": "2021-12-16 06:54:29"
    },
    {
      "id": 2,
      "price": "150.000000",
      "tool_name": "道具2",
      "tool_image": "https://bombgame.s3.us-west-1.amazonaws.com/nbcfzslsncz2qspb8qcfjx6a222n?response-content-disposition=inline%3B%20filename%3D%22icon-bank.png%22%3B%20filename%2A%3DUTF-8%27%27icon-bank.png&response-content-type=image%2Fpng&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT7VBGJ6WEAZAHZXR%2F20211216%2Fus-west-1%2Fs3%2Faws4_request&X-Amz-Date=20211216T065458Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=b9053cae381e5ca1210ba7ee4670dba6091ab210ef620a5975f8d5cb77b88ad8",
      "amount": 2,
      "created_at": "2021-12-16 06:54:31"
    }
  ]
}
