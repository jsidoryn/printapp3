class AddStatusToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :status, :integer, default: 0
    add_index :jobs, :status
  end
end

