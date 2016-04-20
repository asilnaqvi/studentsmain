class AddFullNameToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :full_name, :string
  end
end
