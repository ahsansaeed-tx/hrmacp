class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :salary
      t.string :about
      t.string :comment
      t.references :User, foreign_key: true
      t.references :Job, foreign_key: true

      t.timestamps
    end
  end
end
