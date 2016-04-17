class RemoveColumnFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :school_id, :integer
  end
end
