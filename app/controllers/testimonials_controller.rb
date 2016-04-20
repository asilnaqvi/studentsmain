class TestimonialsController < ApplicationController
	before_action :find_teacher
	before_action :find_testimonial, only: [:show,:edit,:update,:destroy]
	def new
		@teacher=Teacher.find(params[:teacher_id])
		@testimonial=Testimonial.new
	end
	def create
		@teacher=Teacher.find(find_teacher)
		@testimonial=Testimonial.new(params_testimonial)
		@testimonial.teacher_id=@teacher.id
		@testimonial.admin_id=current_admin.id

	if @testimonial.save
		redirect_to teacher_path(@teacher)
	else
		render 'new'
	end
	end
	def edit	
	end

	def update
		if @testimonial.update(params_testimonial)
			redirect_to teacher_path(@teacher)
		else
			render 'edit'
		end
	end

private
	def params_testimonial
		params.require(:testimonial).permit(:rating,:testimonial)
	end
	def find_teacher
		@teacher=Teacher.find(params[:teacher_id])
	end
	def find_testimonial
		@testimonial=Testimonial.find(params[:id])
	end
end
