class Admin::SoldiersController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, only: [
    :list_for_table, :create, :update, :set_off_shelf, :set_on_shelf, :localize_info, :set_localize
  ]

  def index
  end

  def list_for_table
    data = []
    Soldier.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |item|
      data << {
        id: item.id,
        level: item.level('zh-CN'),
        price: item.price,
        bomb_no: item.bomb_no,
        bomb_cost: item.bomb_cost,
        bomb_benefit: item.bomb_benefit,
        duration: item.duration,
        max_employ_amount: item.max_employ_amount,
        contribution: item.contribution,
        power: item.power,
        bomb_cost_pliers: item.bomb_cost_pliers,
        on_shelf: item.on_shelf,
        image: item.image.service_url,
        bomb_image: item.bomb_image.service_url
      }
    end
    ok(total: Soldier.count, rows: data)
  end

  def create
    soldier = Soldier.new(params.require(:soldier).
      permit(:price, :duration, :max_employ_amount, :contribution, :power, :image, :bomb_image,
             :bomb_no, :bomb_cost, :bomb_benefit, :bomb_cost_pliers))
    if soldier.save
      soldier.set_level(params[:soldier][:level], 'zh-CN')
      success
    else
      error(soldier.errors.full_messages[0])
    end
  end

  def update
    if not (soldier = Soldier.find_by(id: params[:id]))
      error('工兵不存在')
    else
      soldier.attributes = params.require(:soldier).
        permit(:price, :duration, :max_employ_amount, :contribution, :power, :image, :bomb_image,
               :bomb_no, :bomb_cost, :bomb_benefit, :bomb_cost_pliers)
      if soldier.save
        soldier.set_level(params[:soldier][:level], 'zh-CN')
        success
      else
        error(miner.errors.full_messages[0])
      end
    end
  end

  def set_on_shelf
    if not (soldier = Soldier.find_by(id: params[:id]))
      error('工兵不存在')
    else
      soldier.update(on_shelf: true)
      success
    end
  end

  def set_off_shelf
    if not (soldier = Soldier.find_by(id: params[:id]))
      error('工兵不存在')
    else
      soldier.update(on_shelf: false)
      success
    end
  end

  def localize_info
    if not (soldier = Soldier.find_by(id: params[:id]))
      error('工兵不存在')
    else
      success(
        level: soldier.level(params[:lang])
      )
    end
  end

  def set_localize
    if not (soldier = Soldier.find_by(id: params[:id]))
      error('工兵不存在')
    else
      soldier.set_level(params[:soldier][:level], params[:lang])
      success
    end
  end

  def bomb_nos
    data = []
    Soldier.find_each do |soldier|
      data << {
        id: soldier.id,
        bomb_no: soldier.bomb_no,
        level: soldier.level,
      }
    end
    success(data)
  end
end
