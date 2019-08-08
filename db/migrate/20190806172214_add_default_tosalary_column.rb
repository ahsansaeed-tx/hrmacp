class AddDefaultTosalaryColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :salary, 0
  end
end
