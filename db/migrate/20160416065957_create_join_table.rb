class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :schools, :boards do |t|
      # t.index [:school_id, :board_id]
      # t.index [:board_id, :school_id]
    end
  end
end
