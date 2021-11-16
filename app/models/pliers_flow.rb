class PliersFlow < ApplicationRecord
  enum flow_type: [:air_drop, :buy, :disposal, :pk]

  belongs_to :user

  def flow_type_name
    I18n.t("models.pliers_flow.flow_types.#{flow_type}")
  end
end
