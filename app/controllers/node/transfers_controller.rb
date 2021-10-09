class Node::TransfersController < ApplicationController
  skip_forgery_protection

  def list
    data = []
    Transfer.init.where(asset_type: params[:asset_type]).order(id: :asc)
            .limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |transfer|
      data << {
        id: transfer.id,
        amount: transfer.amount,
        address: transfer.user.address
      }
    end
    success(data)
  end

  def set_done
    Transfer.where(id: params[:ids]).update_all(state: :done)
    success
  end
end
