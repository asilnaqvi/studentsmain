class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :rating
      t.text :testimonial

      t.timestamps null: false
    end
  end
end
