class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :school_id
      t.string :past_experience
      t.string :qualification

      t.timestamps null: false
    end
  end
end
