class Testimonial < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :admin
end
