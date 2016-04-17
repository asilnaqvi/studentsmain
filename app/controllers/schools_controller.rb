class SchoolsController < ApplicationController
	before_action :find_school, only: [:show,:edit,:update,:destroy]

	def index
	@schools=School.all.order("created_at DESC")
	end
	def account
		@schools=School.where('admin_id'=> 'current_admin.id').order("created_at DESC")
	end
	def new
		@school=current_admin.schools.build

	end

	def create
		
		@school=current_admin.schools.build(params_school)
		
	if @school.save
		redirect_to root_path
	else
		render 'new'
	end
	end

	def show
		@boards=@school.boards
		
	end

	def edit
		

	end

	def update
		if @school.update(params_school)
			redirect_to school_path(@school)
		else
			render 'edit'
		end
	end

	def destroy
		if @school.destroy
			redirect_to root_path
		end
	end
	private
	def params_school
		params.require(:school).permit(:name,:school_img,:phone,:email,:website,:address,:about_us,:board_ids=> [])
	end
	def find_school
		@school=School.find(params[:id])
	end


end
