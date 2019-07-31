class AddForeignKeyToInterview < ActiveRecord::Migration[5.2]
  def change
    #add_reference :interviews, :application, index: true, foreign_key: true
  end
end
