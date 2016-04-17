class AdminsController < ApplicationController
	
	def teacher
		@teachers=Admin.all
	end
end
