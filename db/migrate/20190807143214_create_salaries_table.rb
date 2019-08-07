class CreateSalariesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.date :month
      t.float :salary

      t.timestamps
    end
    add_reference :salaries, :user, index: true, foreign_key: true
    end
end
