class AddColumnsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :name, :string
    add_column :schools, :email, :string
    add_column :schools, :website, :string
    add_column :schools, :phone, :string
    add_column :schools, :admin_id, :integer
    add_column :schools, :about_us, :integer
  end
end
