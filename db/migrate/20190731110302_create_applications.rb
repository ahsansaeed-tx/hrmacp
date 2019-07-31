class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :salary
      t.string :about
      t.string :comment
      t.integer :user_id
      t.integer :job_id
    end
  end
end
