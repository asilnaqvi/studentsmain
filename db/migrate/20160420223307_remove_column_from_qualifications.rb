class RemoveColumnFromQualifications < ActiveRecord::Migration
  def change
    remove_column :qualifications, :teacher_id, :integer
  end
end
