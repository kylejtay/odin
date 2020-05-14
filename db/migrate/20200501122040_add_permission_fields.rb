class AddPermissionFields < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :default_permissions, :jsonb, default: {}
    add_column :users, :permissions, :jsonb, default: {}
  end
end
