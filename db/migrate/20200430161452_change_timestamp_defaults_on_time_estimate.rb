class ChangeTimestampDefaultsOnTimeEstimate < ActiveRecord::Migration[6.0]
  def change
    change_column_default :time_estimates, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :time_estimates, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
