class ChangeSalaryType < ActiveRecord::Migration[5.2]
  def change
    # change_column :users, :salary, :float
    change_column :users, :salary, 'float USING CAST(salary AS float)'
  end
end
