class AddAboutUsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :about_us, :text
  end
end
