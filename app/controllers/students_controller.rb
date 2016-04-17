class StudentsController < ApplicationController
before_action :find_student, only: [:show,:edit,:update,:destroy]

	def index
	@students=Student.all.order("created_at DESC")
	end
	def new
		@student=current_admin.build_student
	end
	def create
		@student=current_admin.build_student(params_student)
	if @student.save
		redirect_to root_path
	else
		render 'new'
	end
	end

	def show
		@schools=@student.schools
	end

	def edit
	end

	def update
		if @student.update(params_student)
			redirect_to student_path(@student)
		else
			render 'edit'
		end
	end

	def destroy
		if @student.destroy
			redirect_to root_path
		end
	end
	private
	def params_student
		params.require(:student).permit(:full_name,:student_img,:contact_no,:admission_year,:qualification,:school_ids=> [])
	end
	def find_student
		@student=Student.find(params[:id])
	end


end
