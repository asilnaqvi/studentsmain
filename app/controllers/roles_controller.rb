class RolesController < ApplicationController
	def new
		@role=Role.new
	end

	def create
		@role=Role.new(params_role)
		
	if @role.save
		redirect_to root_path
	else
		render 'new'
	end
	end
private
	def params_role
		params.require(:role).permit(:name)
	end
	def find_role
		@role=Role.find(params[:id])
	end
end
