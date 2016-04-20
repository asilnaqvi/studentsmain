class DropSchools2 < ActiveRecord::Migration
  def change
  	drop_table :schools
  end
end
