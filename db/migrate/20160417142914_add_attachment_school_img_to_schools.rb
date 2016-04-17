class AddAttachmentSchoolImgToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.attachment :school_img
    end
  end

  def self.down
    remove_attachment :schools, :school_img
  end
end
