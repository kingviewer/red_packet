class CreateSoldiers < ActiveRecord::Migration[6.1]
  def change
    create_table :soldiers, comment: '工兵' do |t|


      t.timestamps
    end
  end
end
