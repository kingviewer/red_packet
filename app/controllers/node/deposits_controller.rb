class Node::DepositsController < ApplicationController
  skip_forgery_protection

  def new_deposits
    params[:items].each do |item|
      addr = item[:from].downcase
      if (user = User.find_by_address(addr)) && !Deposit.exists?(tx_hash: item[:tx_hash])
        amount = BigDecimal(item[:amount])
        user.with_lock do
          if item[:asset_type] == 'usdt'
            User.where(id: user.id).update_all(['packet_usdt_available = packet_usdt_available + ?', amount])
          else
            User.where(id: user.id).update_all(['candy_available = candy_available + ?', amount])
          end
          Deposit.create(
            user_id: user.id,
            tx_hash: item[:tx_hash],
            asset_type: item[:asset_type],
            amount: amount,
            address: addr
          )
          AssetFlow.create(
            user_id: user.id,
            account_type: :packet,
            asset_type: item[:asset_type],
            flow_type: :deposit,
            amount: amount
          )
        end
      end
    end
    success
  end
end
