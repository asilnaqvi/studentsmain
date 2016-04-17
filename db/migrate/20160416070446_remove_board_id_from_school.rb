class RemoveBoardIdFromSchool < ActiveRecord::Migration
  def change
    remove_column :schools, :board_id, :integer
  end
end
