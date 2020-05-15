class RenameBillableHours < ActiveRecord::Migration[6.0]
  def change
    rename_table :billable_hours, :time_entries
  end
end
