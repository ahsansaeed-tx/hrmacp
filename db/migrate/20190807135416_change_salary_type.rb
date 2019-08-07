class ChangeSalaryType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :salary, :float
  end
end
