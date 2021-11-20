class GlobalConfigsController < BaseUserController
  def pliers_price
    g = GlobalConfig.first
    success(
      exchange_pliers_price: g.exchange_pliers_price,
      pk_pliers_price: g.pk_pliers_price
    )
  end
end
