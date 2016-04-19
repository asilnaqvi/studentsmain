class TeachersController < ApplicationController
before_action :find_teacher, only: [:show,:edit,:update,:destroy]

	def index
	@teachers=Teacher.all.order("created_at DESC")
	end
	def new
		@teacher=current_admin.build_teacher
	end
	def create
		@teacher=current_admin.build_teacher(params_teacher)
	if @teacher.save
		redirect_to root_path
	else
		render 'new'
	end
	end

	def show
		@schools=@teacher.schools
	end

	def edit
		

	end

	def update
		if @teacher.update(params_teacher)
			redirect_to teacher_path(@teacher)
		else
			render 'edit'
		end
	end

	def destroy
		if @teacher.destroy
			redirect_to root_path
		end
	end
	private
	def params_teacher
		params.require(:teacher).permit(:full_name,:about_us,:teacher_img,:past_experience,:qualification,:school_ids=> [])
	end
	def find_teacher
		@teacher=Teacher.find(params[:id])
	end


end