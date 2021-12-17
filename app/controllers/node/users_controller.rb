class Node::UsersController < ApplicationController
  def create
    user = User.new(address: params[:user].downcase)
    unless User.exists?(address: user.address)
      if params[:parent]
        if (parent = User.find_by_address(params[:parent].downcase))
          user.parent_id = parent.id
        else
          user.pending_parent = params[:parent].downcase
        end
      end
      begin
        user.gen_invite_code
        user.save!
      rescue => e
        Rails.logger.error(e.message)
        retry
      end
    end
    success
  end

end
