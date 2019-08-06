class AddDefaultTosalaryColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :salary, 00000
  end
end
