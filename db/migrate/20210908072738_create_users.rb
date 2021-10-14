class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :invite_code, null: false, limit: 10, index: {unique: true}, comment: '邀请码'
      t.string :address, null: false, limit: 100, index: {unique: true}, comment: '钱包账户地址'
      t.integer :role, null: false, default: 0, index: true, comment: '角色'
      t.references :parent, index: true, comment: '邀请人ID'
      t.decimal :chain_usdt_available, null: false, default: 0, precision: 20, scale: 8, comment: '链上USDT可用余额'
      t.decimal :packet_usdt_available, null: false, default: 0, precision: 20, scale: 8, comment: '红包USDT可用余额'
      t.decimal :packet_usdt_frozen, null: false, default: 0, precision: 20, scale: 8, comment: '红包USDT冻结金额'
      t.decimal :chain_cigar_available, null: false, default: 0, precision: 20, scale: 8,  comment: '链上BOMB可用余额'
      t.decimal :candy_available, null: false, default: 0, precision: 20, scale: 8, comment: '糖果可用余额'
      t.decimal :candy_frozen, null: false, default: 0, precision: 20, scale: 8, comment: '糖果冻结金额'

      t.decimal :team_usdt_flow, null: false, default: 0, precision: 20, scale: 8, comment: '伞下流水'
      t.references :agent, index: true, comment: '所属代理ID'
      t.integer :state, null: false, default: 0, index: true, comment: '状态'

      t.timestamps
    end
  end
end
