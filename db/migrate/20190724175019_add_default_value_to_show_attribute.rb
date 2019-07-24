class AddDefaultValueToShowAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column_default :interviews, :interview_confirmation, false
  end
end
