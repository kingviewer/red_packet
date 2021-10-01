class Notice < ApplicationRecord
  enum language: [:en, :'zh-CN', :ko]
end
