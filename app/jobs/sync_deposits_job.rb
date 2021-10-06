class SyncDepositsJob < ApplicationJob
  queue_as :default

  def perform
    client = Utils::EthereumClient.new
    c_usdt = Utils::Constants::CONTRACTS[:usdt]
    c_cic = Utils::Constants::CONTRACTS[:cic]
    contract_usdt = client.get_contract(c_usdt[:abi], c_usdt[:address])
    contract_cic = client.get_contract(c_cic[:abi], c_cic[:address])
    global_config = GlobalConfig.first
    u_block = global_config.deposit_sniffer_block
    c_block = u_block

    client.get_deposits(contract_usdt, global_config.deposit_sniffer_block) do |tx_hash, amount, to_addr, t_b|
      on_new_tx(tx_hash, amount, to_addr, :usdt, c_usdt[:decimals])
      u_block = t_b
    end

    client.get_deposits(contract_cic, global_config.deposit_sniffer_block) do |tx_hash, amount, to_addr, t_b|
      on_new_tx(tx_hash, amount, to_addr, :cic, c_cic[:decimals])
      c_block = t_b
    end

    global_config.update(deposit_sniffer_block: u_block < c_block ? u_block : c_block)
  end

  private

  def on_new_tx(tx_hash, amount, to_addr, asset_type, decimals)
    if (user = User.find_by_address(to_addr.downcase))
      unless Deposit.exists?(tx_hash: tx_hash)
        Deposit.create(
          uuser_id: user.id,
          tx_hash: tx_hash,
          address: user.address,
          asset_type: asset_type,
          amount: amount * (10 ** -decimals)
        )
      end
    end
  end
end
