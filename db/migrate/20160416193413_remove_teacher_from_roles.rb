class RemoveTeacherFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :teacher, :string
    remove_column :roles, :parent, :string
    remove_column :roles, :administrator, :string
    remove_column :roles, :name, :integer
  end
end
