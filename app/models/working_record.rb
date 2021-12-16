class WorkingRecord < ApplicationRecord
  enum state: [:working, :finished]

  belongs_to :user_tool
end
