class AddFieldsToSoldiers < ActiveRecord::Migration[6.1]
  def change
    add_column :soldiers, :day_working_times, :integer, null: false, default: 2, comment: '每天可工作次数'
    add_column :soldiers, :working_duration, :integer, null: false, default: 30, comment: '每次工作时长(分钟)'
  end
end
