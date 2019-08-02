class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slack, :string
    add_column :users, :github, :string
    add_column :users, :fb, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
  end
end
