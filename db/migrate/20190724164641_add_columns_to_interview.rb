class AddColumnsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :interview_confirmation, :boolean
    add_column :interviews, :status, :integer
  end
end
