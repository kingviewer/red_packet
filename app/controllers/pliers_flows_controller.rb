class PliersFlowsController < BaseUserController
  before_action :ajax_auth_user

  def list_all
    data = []
    cur_user.pliers_flows.order(id: :desc).limit(50).each do |flow|
      data << {
        id: flow.id,
        flow_type: flow.flow_type,
        flow_type_name: flow.flow_type_name,
        amount: flow.amount,
        created_at: flow.formatted_created_at
      }
    end
    success(data)
  end
end
