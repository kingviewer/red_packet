class TransfersController < BaseUserController
  before_action :ajax_auth_user

  def create
    transfer = Transfer.new(params.require(:transfer).permit(:asset_type, :amount))
    transfer.user_id = cur_user.id
    cur_user.with_lock do
      if transfer.usdt? && transfer.amount > cur_user.packet_usdt_available ||
        transfer.cigar? && transfer.amount > cur_user.candy_available
        error(t('dashboard.index.balance_insufficient'))
      elsif not transfer.save
        error(transfer.errors.full_messages[0])
      else
        User.where(id: cur_user.id).update_all(
          [transfer.usdt? ? 'packet_usdt_available = packet_usdt_available - ?' : 'candy_available = candy_available - ?',
           transfer.amount]
        )
        success
      end
    end
  end
end
