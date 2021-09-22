class CreateUserSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sessions do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.string :token, limit: 22, index: { unique: true }, comment: 'Token'

      t.timestamps
    end
  end
end
