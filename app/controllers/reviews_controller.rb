class ReviewsController < ApplicationController
	before_action :find_school
	before_action :find_review, only: [:show,:edit,:update,:destroy]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]
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
def edit	
	end

	def update
		if @review.update(params_review)
			redirect_to school_path(@school)
		else
			render 'edit'
		end
	end
	def destroy
		if @review.destroy
			redirect_to root_path
		end
	end
	private
	def params_review
		params.require(:review).permit(:rating,:comment)
	end
	def find_school
		@school=School.find(params[:school_id])
	end
	def find_review
		@review=Review.find(params[:id])
	end
	def ensure_admin
 unless current_admin.id==@review.admin_id 
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin && current_admin.role_id!=4
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end
end
