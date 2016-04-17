class AddRoleNameToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :name, :integer
  end
end
