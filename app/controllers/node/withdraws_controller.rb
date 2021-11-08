class Node::WithdrawsController < ApplicationController

  def new_withdraws
    params[:items].each do |item|
      addr = item[:to].downcase
      if (user = User.find_by_address(addr)) && !AssetFlow.exists?(flow_type: :withdraw, tx_hash: item[:tx_hash])
        amount = BigDecimal(item[:amount])
        AssetFlow.create(
          user_id: user.id,
          tx_hash: item[:tx_hash],
          asset_type: item[:asset_type],
          account_type: :wallet,
          flow_type: :withdraw,
          amount: -amount
        )
      end
    end
    success
  end
end