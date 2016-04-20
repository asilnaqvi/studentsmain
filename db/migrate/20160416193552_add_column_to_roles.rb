class AddColumnToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :name, :String
  end
end
