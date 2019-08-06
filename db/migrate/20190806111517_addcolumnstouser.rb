class Addcolumnstouser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :university, :string
    add_column :users, :designation, :string
  end
end
