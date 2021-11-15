class SoldiersController < BaseUserController
  def list_all
    data = []
    Soldier.where(on_shelf: true).order(price: :asc).each do |soldier|
      data << {
        id: soldier.id,
        level: soldier.level,
        price: soldier.price,
        power: soldier.power,
        duration: soldier.duration,
        contribution: soldier.contribution,
        image: soldier.image.service_url
      }
    end
    success(data)
  end

  def buy
    
  end
end
