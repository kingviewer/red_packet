class Html
  include Mongoid::Document
  include Mongoid::Timestamps

  field :html, type: String, localize: true, label: 'HTML内容'
  field :record_id, type: Integer, label: '关联记录ID'
  field :record_type, type: String, label: '关联记录类型'
  field :name, type: String, label: '关联记录html字段名称'

  index record_type: 1, record_id: 1, name: 1
end
