class SyncPendingParentsJob < ApplicationJob
  queue_as :default

  def perform
    User.where('pending_parent is not NULL').each do |user|
      if (parent = User.find_by_address(user.pending_parent))
        user.update(parent_id: parent.id, pending_parent: nil)
      end
    end
  end
end
