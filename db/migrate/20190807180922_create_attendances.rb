class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date
      t.string :value

      t.timestamps
    end
    add_reference :attendances, :user, index: true, foreign_key: true
    add_column :users, :attendance_value, :boolean, default: false
  end
end
