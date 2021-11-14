class Text
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String, localize: true, label: '内容'
  field :record_type, type: String, label: 'ActiveRecord 记录类型'
  field :record_id, type: Integer, label: 'ActiveRecord 记录ID'
  field :name, type: String, label: 'ActiveRecord 模型中该text字段的名称'

  index record_type: 1, record_id: 1, name: 1
end
