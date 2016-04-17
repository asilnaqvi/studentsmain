class AddAttachmentTeacherImgToTeachers < ActiveRecord::Migration
  def self.up
    change_table :teachers do |t|
      t.attachment :teacher_img
    end
  end

  def self.down
    remove_attachment :teachers, :teacher_img
  end
end
