class ChangeTypeInterview < ActiveRecord::Migration[5.2]
  def change
    change_column :interviews, :time1, :datetime
    change_column :interviews, :date, :date
  end
end
