class RemoveStudentFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :student, :string
  end
end
