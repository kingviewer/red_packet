class ToolFlow < ApplicationRecord
  enum flow_type: [:buy, :use]
end
