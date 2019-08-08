class AddColumnToUserUpdateProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :update_profile, :boolean, default: false
  end
end
