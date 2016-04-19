class TestimonialsController < ApplicationController
	def new
		@teacher=Teacher.find(params[:teacher_id])
		@testimonial=Testimonial.new
	end
	def create
		@teacher=Teacher.find(find_teacher)
		@testimonial=Testimonial.new(params_testimonial)
		@testimonial.school_id=@teacher.id
		@testimonial.admin_id=current_admin.id

	if @testimonial.save
		redirect_to teacher_path(@teacher)
	else
		render 'new'
	end
	end

	def params_testimonial
		params.require(:testimonial).permit(:rating,:testimonial)
	end
	def find_teacher
		@teacher=Teacher.find(params[:school_id])
	end
end
