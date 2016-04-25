class AddAdminIdToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :admin_id, :integer
  end
end
