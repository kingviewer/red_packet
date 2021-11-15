class AddRoleFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :my_contribution, :bigint, null: false, default: 0, comment: '我的贡献'
    add_column :users, :team_contribution, :bigint, null: false, default: 0, comment: '团队贡献(不含自己)'
    add_column :users, :team_pai, :bigint, null: false, default: 0, comment: '伞下排长数量(含自己)'
    add_column :users, :team_lian, :bigint, null: false, default: 0, comment: '伞下连长数量(含自己)'
    add_column :users, :team_ying, :bigint, null: false, default: 0, comment: '伞下营长数量(含自己)'
    add_column :users, :team_tuan, :bigint, null: false, default: 0, comment: '伞下团长数量(含自己)'
    add_column :users, :team_shi, :bigint, null: false, default: 0, comment: '伞下师长数量(含自己)'
    add_column :users, :team_jun, :bigint, null: false, default: 0, comment: '伞下军长数量(含自己)'
  end
end
