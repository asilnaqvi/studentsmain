class AddAdminIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :admin_id, :integer
  end
end
