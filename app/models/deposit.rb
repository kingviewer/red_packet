class Deposit < ApplicationRecord
  enum asset_type: [:usdt, :cigar]

  after_create :sync_balance

  private

  def sync_balance
    field_name =
      if usdt?
        'packet_usdt_available'
      else
        'candy_available'
      end
    User.where(id: user_id).update_all(["#{field_name} = #{field_name} + ?", amount])
    AssetFlow.create(
      user_id: user_id,
      flow_type: :deposit,
      asset_type: asset_type,
      account_type: :packet,
      amount: amount
    )
  end
end
