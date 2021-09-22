class CreateAdminSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_sessions do |t|
      t.references :admin, null: false, index: { unique: true }, comment: 'Admin ID'
      t.string :token, limit: 22, index: { unique: true }, comment: 'Token'
      t.string :ip_addr, limit: 15, comment: 'IP地址'

      t.timestamps
    end
  end
end
