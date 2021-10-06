require 'lz_utils'

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

    def get_deposits(contract, start_block)
      cur_block_number = get_client.eth_block_number['result'].to_i(16)
      if start_block <= cur_block_number
        from_block = start_block
        loop do
          to_block = from_block + 100
          to_block = cur_block_number if to_block > cur_block_number
          filter_id = contract.new_filter.transfer(
            {
              from_block: "0x#{from_block.to_s(16)}",
              to_block: "0x#{to_block.to_s(16)}",
              topics: []
            }
          )
          event_abi = contract.abi.find { |a| a['name'] == 'transfer' }
          event_inputs = event_abi['inputs'].map { |i| OpenStruct.new(i) }
          decoder = Ethereum::Decoder.new
          contract.get_filter_logs.transfer(filter_id).each do |event|
            transaction_id = event[:transactionHash]
            if (transaction = get_client.eth_get_transaction_by_hash(transaction_id))
              if transaction['result']
                next unless transaction['result']['input'].length == 138
                args = decoder.decode_arguments(event_inputs, transaction['result']['input'][10..-1])
                to_addr = "0x#{args[0]}"
                amount = BigDecimal(args[1])
                yield(transaction_id, amount, to_addr, to_block)
              end
            end
          end
          break if to_block >= cur_block_number
          from_block = to_block
        end
      end
    end

    private

    def get_client
      @client = Ethereum::HttpClient.new(Constants::WALLET_URL) unless @client
      @client
    end
  end
end