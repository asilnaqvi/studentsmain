class AddAboutUsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :about_us, :text
  end
end
