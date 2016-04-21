class AddColumnToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :qualification_id, :integer
  end
end
