class Student < ActiveRecord::Base
	belongs_to :admin
	has_and_belongs_to_many :schools
 	has_attached_file :student_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :student_img, content_type: /\Aimage\/.*\Z/
end
