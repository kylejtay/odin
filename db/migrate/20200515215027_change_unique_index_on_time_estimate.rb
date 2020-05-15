class ChangeUniqueIndexOnTimeEstimate < ActiveRecord::Migration[6.0]
  def change
    add_index "time_estimates", ["start_time", "user_id", "task_id"], :unique => true
  end
end
