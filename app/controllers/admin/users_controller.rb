class Admin::UsersController < Admin::BaseController
  before_action :auth_admin, only: [:index, :tree]
  before_action :ajax_auth_admin, only: [:list_for_table, :list_tree, :lock, :unlock, :set_role, :set_parent]

  def index
  end

  def tree
  end

  def list_for_table
    data = []
    relation = list_relation
    relation.order(id: :desc).limit(params[:limit].to_i).offset(params[:limit].to_i * params[:page].to_i).each do |user|
      data << {
        id: user.id,
        invite_code: user.invite_code,
        address: user.address,
        role: user.role,
        role_name: user.role_name,
        state: user.state,
        state_name: user.state_name,
        parent: user.parent&.invite_code,
        packet_usdt: LZUtils.format_coin(user.packet_usdt),
        candy: LZUtils.format_coin(user.candy),
        team_usdt_flow: LZUtils.format_coin(user.team_usdt_flow),
        team_user_amount: user.team_user_amount,
        pliers_amount: user.pliers_amount,
        created_at: user.formatted_created_at
      }
    end
    ok(rows: data, total: relation.count)
  end

  def list_tree
    data = []
    if not params[:id].blank?
      users = User.where(parent_id: params[:id])
    else
      attrs = ['id > 0']
      if params[:keyword] && params[:keyword].strip.length > 0
        attrs[0] << ' and (address like ? or invite_code like ?)'
        2.times { attrs << "%#{params[:keyword].strip}%" }
      end
      users = []
      tmp_user = User.where(attrs).first
      users << tmp_user if tmp_user
    end
    users.each do |user|
      data << {
        id: user.id,
        name: "#{user.invite_code}(#{user.address}, 伞下人数 #{user.team_user_amount})",
        isParent: User.where(parent_id: user.id).exists?
      }
    end

    ok(data)
  end

  def lock
    if not (user = User.find_by(id: params[:id]))
      error('用户不存在')
    else
      user.locked!
      success
    end
  end

  def unlock
    if not (user = User.find_by(id: params[:id]))
      error('用户不存在')
    else
      user.normal!
      success
    end
  end

  def set_role
    if not (user = User.find_by(id: params[:id]))
      error('用户不存在')
    else
      user.update(role: params[:role])
      success
    end
  end

  def set_parent
    if not (user = User.find_by(id: params[:id]))
      error('用户不存在')
    elsif not (parent = User.find_by_invite_code(params[:parent_invite_code]))
      error('邀请人不存在')
    else
      user.update(parent_id: parent.id)
      success
    end
  end

  private

  def list_relation
    relation = User.includes(:parent)
    unless params[:keyword].blank?
      keyword = "%#{params[:keyword].strip}%"
      relation = relation.where(['address like ? or invite_code like ?', keyword, keyword])
    end
    relation = relation.where(role: params[:role]) unless params[:role].blank?
    relation
  end
end
