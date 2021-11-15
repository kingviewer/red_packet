class BombFlow < ApplicationRecord
  enum flow_type: [:search, :disposal]

  belongs_to :user
  belongs_to :soldier

  def flow_type_name
    I18n.t("models.bomb_flow.flow_types.#{flow_type}")
  end
end
