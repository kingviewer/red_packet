class Node::TransfersController < ApplicationController

  def list
    data = []
    Transfer.init.order(id: :asc)
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
    Transfer.where(id: params[:ids]).each do |transfer|
      transfer.done!
      AssetFlow.create(
        user_id: transfer.user_id,
        account_type: :wallet,
        asset_type: transfer.asset_type,
        flow_type: :transfer,
        amount: transfer.amount
      )
    end
    success
  end
end
