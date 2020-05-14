class CreateBillableHours < ActiveRecord::Migration[6.0]
  def change
    create_table :billable_hours do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.decimal :hours, :decimal, precision: 10, scale: 3

      t.timestamps
    end
    add_index "billable_hours", ["start_time", "user_id", "project_id"], :unique => true
  end
end
