class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :time
      t.string :date
      t.string :address

      t.timestamps
    end
  end
end
