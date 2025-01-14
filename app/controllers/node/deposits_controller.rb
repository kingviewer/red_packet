class Node::DepositsController < ApplicationController

  def new_deposits
    params[:items].each do |item|
      addr = item[:from].downcase
      if (user = User.find_by_address(addr)) && !Deposit.exists?(tx_hash: item[:tx_hash])
        amount = BigDecimal(item[:amount])
        Deposit.create(
          user_id: user.id,
          tx_hash: item[:tx_hash],
          asset_type: item[:asset_type],
          transfer: params[:transfer] || false,
          amount: amount,
          address: addr
        )
      end
    end
    success
  end
end
