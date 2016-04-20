class StudentsController < ApplicationController
before_action :find_student, only: [:show,:edit,:update,:destroy]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]


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
		params.require(:student).permit(:full_name,:about_us,:student_img,:contact_no,:admission_year,:qualification,:school_ids=> [])
	end
	def find_student
		@student=Student.find(params[:id])
	end
def ensure_admin
 unless current_admin.id==@student.admin_id && current_admin.role_id==2
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin && current_admin.role_id==2
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

end
