class SchoolsController < ApplicationController
	before_action :find_school, only: [:show,:edit,:update,:destroy]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]
	

	def index
		
	@boards=Board.all
	@messages=Message.all
	if params[:board].blank?
	@schools=School.all
else
	@board=Board.find_by(name: params[:board])
	@schools=@board.schools
end
	end


	def account
	@boards=Board.all
	@messages=Message.all
	if params[:board].blank?
	@schools=School.where(admin_id: current_admin.id)
else
	@board=Board.find_by(name: params[:board])
	@schools=@board.schools.where(admin_id: current_admin.id)
end
		
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
		if @school.reviews.blank?
			@average_review=0
else
			@average_review=@school.reviews.average(:rating).round(2)
		end
		
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
def ensure_admin
 unless current_admin.id==@school.admin_id && current_admin.role_id==4
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin && current_admin.role_id==4
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

end
