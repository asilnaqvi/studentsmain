class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :contact_no
      t.string :admission_year
      t.string :qualification
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
