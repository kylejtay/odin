class ChangeTimeEntryToTaskAssociation < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_entries, :project_id
    add_reference :time_entries, :task, index: true
  end
end
