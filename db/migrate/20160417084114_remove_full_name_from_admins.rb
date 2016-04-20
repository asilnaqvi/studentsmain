class RemoveFullNameFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :full_name, :string
  end
end
