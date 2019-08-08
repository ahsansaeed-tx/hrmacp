class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :salary, :number
    add_column :users, :salary, :integer
  end
end
