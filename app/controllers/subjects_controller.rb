class SubjectsController < ApplicationController
before_action :find_subject, only: [:show,:edit,:update,:destroy]
	def index
	@subjects=Subject.all.order("created_at DESC")	
	end
	def new
		@subject=Subject.new
	end

	def create
	@subject=Subject.new(params_subject)

	if @subject.save
		redirect_to root_path
	else
		render 'new'
	end
	end

	def show
	end

	def edit
		

	end

	def update
		if @subject.update(find_subject)
			redirect_to teacher_path(@subject)
		else
			render 'edit'
		end
	end

	def destroy
		if @subject.destroy
			redirect_to root_path
		end
	end
	
	private
	def params_subject
		params.require(:subject).permit(:name)
	end
	def find_subject
		@subject=Subject.find(params[:id])
	end
end

