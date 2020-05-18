class ChangeUniqueIndexOnTimeEntry < ActiveRecord::Migration[6.0]
  def change
    add_index "time_entries", ["start_time", "user_id", "task_id"], :unique => true
  end
end
