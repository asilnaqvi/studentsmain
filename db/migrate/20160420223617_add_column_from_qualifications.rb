class AddColumnFromQualifications < ActiveRecord::Migration
  def change
    add_column :qualifications, :teacher_id, :integer
  end
end
