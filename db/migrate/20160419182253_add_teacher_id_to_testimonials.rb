class AddTeacherIdToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :teacher_id, :integer
  end
end
