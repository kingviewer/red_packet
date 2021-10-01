class DepositsController < BaseUserController
  before_action :ajax_auth_user

  def create
    if params[:tx_hash] !~ /^0x[\da-f]{64}$/i
      error(t('.create.tx_hash_invalid'))
    elsif Deposit.exists?(tx_hash: params[:tx_hash])
      error(t('deposits.create.tx_hash_exists'))
    else
      deposit = Deposit.create(tx_hash: params[:tx_hash])
      deposit.destroy if Deposit.where(tx_hash: params[:tx_hash]).count > 1
      success
    end
  end
end
