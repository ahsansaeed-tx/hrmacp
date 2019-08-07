class AddColumntoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salary_status, :boolean, default: false
  end
end
