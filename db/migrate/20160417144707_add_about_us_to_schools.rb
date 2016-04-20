class AddAboutUsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :about_us, :string
  end
end
