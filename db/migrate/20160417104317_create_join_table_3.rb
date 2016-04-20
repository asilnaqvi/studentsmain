class CreateJoinTable3 < ActiveRecord::Migration
  def change
    create_join_table :students, :schools do |t|
      # t.index [:student_id, :school_id]
      # t.index [:school_id, :student_id]
    end
  end
end
