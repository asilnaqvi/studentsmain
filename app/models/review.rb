class Review < ActiveRecord::Base
	belongs_to :admin
	belongs_to :school
end
