class AddAttachmentStudentImgToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :student_img
    end
  end

  def self.down
    remove_attachment :students, :student_img
  end
end
