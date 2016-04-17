class School < ActiveRecord::Base
  belongs_to :admin
  has_and_belongs_to_many :boards
  has_many :reviews
   has_and_belongs_to_many :teachers
    has_and_belongs_to_many :students
  has_attached_file :school_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :school_img, content_type: /\Aimage\/.*\Z/
end
