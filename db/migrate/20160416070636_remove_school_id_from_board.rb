class RemoveSchoolIdFromBoard < ActiveRecord::Migration
  def change
    remove_column :boards, :school_id, :integer
  end
end
