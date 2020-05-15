class AddBudgetToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :billing_type, :integer
    add_column :projects, :hours_budget, :integer
  end
end
