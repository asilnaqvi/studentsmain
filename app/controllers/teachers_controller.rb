class TeachersController < ApplicationController
	before_action :find_teacher, only: [:show,:edit,:update,:destroy]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]

	
	def index
	@subjects=Subject.all
	@qualifications=Qualification.all
		if params[:subject].blank? && params[:qualification].blank?
	@teachers=Teacher.all.paginate(page: params[:page],per_page: 9)
elsif params[:qualification].present? && params[:subject].blank?
	@qualification=Qualification.find_by(name: params[:qualification])
	@teachers=@qualification.teachers.paginate(page: params[:page],per_page: 9)
else
	@subject=Subject.find_by(name: params[:subject])
	@teachers=@subject.teachers.paginate(page: params[:page],per_page: 9)
end
	end
	def new
		@qualification=Qualification.all.map{|c| [c.name, c.id]}
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
		@subjects=@teacher.subjects
		@schools=@teacher.schools
		if @teacher.testimonials.blank?
			@average_testimonial=0
else
			@average_testimonial=@teacher.testimonials.average(:rating)
		end
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
		params.require(:teacher).permit(:full_name,:about_us,:teacher_img,:past_experience,:qualification_id,:subject_ids=> [],:school_ids=> [])
	end
	def find_teacher
		@teacher=Teacher.find(params[:id])
	end

def ensure_admin
 unless current_admin.id==@teacher.admin_id && current_admin.role_id==1
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin && current_admin.role_id==1
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end
end