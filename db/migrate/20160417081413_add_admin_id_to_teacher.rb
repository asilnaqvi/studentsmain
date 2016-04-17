class AddAdminIdToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :admin_id, :integer
  end
end
