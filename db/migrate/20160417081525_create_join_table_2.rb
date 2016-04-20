class CreateJoinTable2 < ActiveRecord::Migration
  def change
    create_join_table :teachers, :schools do |t|
      # t.index [:teacher_id, :school_id]
      # t.index [:school_id, :teacher_id]
    end
  end
end
