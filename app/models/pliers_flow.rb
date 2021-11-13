class PliersFlow < ApplicationRecord
  enum flow_type: [:air_drop]

  def flow_type_name
    I18n.t("models.pliers_flow.#{flow_type}")
  end
end
