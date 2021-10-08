class Node::DepositsController < ApplicationController
  skip_forgery_protection

  def new_deposits
    params[:items].each do |item|
      addr = item[:from].downcase
      if (user = User.find_by_address(addr)) && !Deposit.exists?(tx_hash: item[:tx_hash])
        amount = BigDecimal(item[:amount])
        Deposit.create(
          user_id: user.id,
          tx_hash: item[:tx_hash],
          asset_type: item[:asset_type],
          amount: amount,
          address: addr
        )
      end
    end
    success
  end
end
