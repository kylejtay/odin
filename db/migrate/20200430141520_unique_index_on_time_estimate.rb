class UniqueIndexOnTimeEstimate < ActiveRecord::Migration[6.0]
  def change
    add_column :time_estimates, :hours, :decimal
    add_index "time_estimates", ["start_time", "user_id", "project_id"], :unique => true
  end
end
