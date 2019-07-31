class ChangeTypeInterview < ActiveRecord::Migration[5.2]
  def change
    change_column :interviews, :time, 'time USING CAST(time AS time)'
    change_column :interviews, :date, :date
  end
end
