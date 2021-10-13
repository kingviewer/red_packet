class Admin::SysAccountsController < Admin::BaseController
  before_action :auth_admin, only: :index
  before_action :ajax_auth_admin, except: :index

  def index
  end

  def list_for_table
    data = []
    SysAccount.find_each do |account|
      data << {
        id: account.id,
        account_type: account.account_type,
        account_type_name: account.account_type_name,
        asset_symbol: account.asset_symbol,
        balance: LZUtils.format_coin(account.balance),
        total: LZUtils.format_coin(account.total)
      }
    end
    ok(rows: data, total: SysAccount.count)
  end

  def list_for_select
    data = []
    SysAccount.find_each do |account|
      data << {
        id: account.id,
        name: account.account_type_name
      }
    end
    success(data)
  end

  def decrease
    flow = SysFlow.new(params.require(:sys_flow).permit(:amount, :remark, :sys_account_id))
    if not flow.sys_account
      error('系统账户不存在')
    elsif flow.sys_account.balance < flow.amount
      error('系统账户余额不足')
    else
      flow.sys_account.update(balance: flow.sys_account.balance - flow.amount)
      flow.amount = -flow.amount
      flow.admin_id = cur_session.admin_id
      flow.flow_type = :bg_decrease
      flow.save
      success
    end
  end
end
