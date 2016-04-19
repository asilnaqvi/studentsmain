class ReviewsController < ApplicationController
	def new
		@school=School.find(params[:school_id])
		@review=Review.new
	end
	def create
		@school=School.find(find_school)
		@review=Review.new(params_review)
		@review.school_id=@school.id
		@review.admin_id=current_admin.id

	if @review.save
		redirect_to school_path(@school)
	else
		render 'new'
	end
	end

	def params_review
		params.require(:review).permit(:rating,:comment)
	end
	def find_school
		@school=School.find(params[:school_id])
	end
end
