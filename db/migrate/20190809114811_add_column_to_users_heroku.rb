class AddColumnToUsersHeroku < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salary, :float, default: 0.0
  end
end
