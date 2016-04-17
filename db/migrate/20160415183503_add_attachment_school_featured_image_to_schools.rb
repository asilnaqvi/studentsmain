class AddAttachmentSchoolFeaturedImageToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.attachment :school_featured_image
    end
  end

  def self.down
    remove_attachment :schools, :school_featured_image
  end
end
