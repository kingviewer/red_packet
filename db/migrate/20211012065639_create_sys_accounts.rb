class CreateSysAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :sys_accounts do |t|
      t.integer :account_type, null: false, index: {unique: true}, comment: '账号类型'
      t.decimal :balance, null: false, default: 0, precision: 20, scale: 8, comment: '余额'
      t.decimal :total, null: false, default: 0, precision: 20, scale: 8, comment: '累计金额'

      t.timestamps
    end
  end
end
