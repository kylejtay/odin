class ChangeToTaskAssociation < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_estimates, :project_id
    add_reference :time_estimates, :task, index: true
  end
end
