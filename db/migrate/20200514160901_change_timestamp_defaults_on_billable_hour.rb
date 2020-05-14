class ChangeTimestampDefaultsOnBillableHour < ActiveRecord::Migration[6.0]
  def change
    change_column_default :billable_hours, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :billable_hours, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
