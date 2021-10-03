class SyncDepositsJob < ApplicationJob
  queue_as :default

  def perform
    client = Utils::EthereumClient.new
    Deposit.under_check.order(id: :desc).find_each do |deposit|
      deposit.under_confirm!
      tx = client.get_usdt_transaction(deposit.tx_hash)
      if tx[:to] == Utils::Constants::CONTRACTS[:game][:address].downcase
        if (user = User.find_by(address: tx[:from]))
          User.where(id: user.id).update_all(['packet_usdt_available = packet_usdt_available + ?', tx[:amount]])
          deposit.update(state: :confirmed, amount: tx[:amount], user_id: user.id, address: user.address)
          AssetFlow.create(
            user_id: user.id,
            flow_type: :deposit,
            asset_type: :usdt,
            account_type: :packet,
            amount: tx[:amount]
          )
        else
          deposit.under_check!
        end
      else
        deposit.fake!
      end
    end
  end
end
