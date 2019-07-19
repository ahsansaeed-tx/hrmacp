class AddJobToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :job_id, :integer
  end
end
