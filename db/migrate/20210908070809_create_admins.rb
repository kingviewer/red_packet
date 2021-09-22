class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :account, null: false, limit: 40, index: { unique: true }, comment: '账号'
      t.string :password_digest, null: false, limit: 100, comment: '登录密码摘要'
      t.string :nickname, null: false, limit: 50, comment: '昵称'
      t.integer :role, null: false, index: true, comment: '角色'
      t.boolean :locked, null: false, default: false, index: true, comment: '是否锁定'
      t.boolean :deleted, null: false, default: false, index: true, comment: '删除标记'

      t.timestamps
    end
  end
end
