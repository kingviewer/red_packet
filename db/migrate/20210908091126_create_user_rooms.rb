class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.references :user, null: false, index: true, comment: '用户ID'
      t.references :game_room, null: false, index: true, comment: '密码房ID'
      t.boolean :joined, null: false, default: false, index: true, comment: '是否已参加'

      t.timestamps
    end
  end
end
