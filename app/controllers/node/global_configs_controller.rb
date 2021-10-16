class Node::GlobalConfigsController < ApplicationController
  def blocks_config
    g = GlobalConfig.first
    success(
      deposit_sniffer_block: g.deposit_sniffer_block,
      inner_deposit_sniffer_block: g.inner_deposit_sniffer_block,
      withdraw_sniffer_block: g.withdraw_sniffer_block
    )
  end

  def update_block_config
    g = GlobalConfig.first
    g.deposit_sniffer_block = params[:deposit_sniffer_block] if params[:deposit_sniffer_block]
    g.inner_deposit_sniffer_block = params[:inner_deposit_sniffer_block] if params[:inner_deposit_sniffer_block]
    g.withdraw_sniffer_block = params[:withdraw_sniffer_block] if params[:withdraw_sniffer_block]
    g.save
    success
  end
end
