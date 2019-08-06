class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salary, :number
  end
end
