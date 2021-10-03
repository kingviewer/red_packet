module Utils
  class EthereumClient
    def get_transaction(contract_abi, contract_address, decimals, tx_hash)
      contract = get_contract(contract_abi, contract_address)
      transaction = get_client.eth_get_transaction_by_hash(tx_hash)
      event_abi = contract.abi.find { |a| a['name'] == 'transfer' }
      event_inputs = event_abi['inputs'].map { |i| OpenStruct.new(i) }
      decoder = Ethereum::Decoder.new
      args = decoder.decode_arguments(event_inputs, transaction['result']['input'][10..-1])
      to_addr = "0x#{args[0]}"
      amount = BigDecimal(args[1]) * (10 ** -decimals)
      {
        from: transaction['result']['from'],
        to: to_addr,
        amount: amount
      }
    end

    def get_usdt_transaction(tx_hash)
      contract = Utils::Constants::CONTRACTS[:usdt]
      get_transaction(contract[:abi], contract[:address], contract[:decimals], tx_hash)
    end

    def get_contract(abi, address)
      Ethereum::Contract.create(client: get_client, name: "Erc20Asset#{LZUtils.gen_rand_str(4)}", abi: abi, address: address)
    end

    private

    def get_client
      @client = Ethereum::HttpClient.new("http://localhost:8545") unless @client
      @client
    end
  end
end