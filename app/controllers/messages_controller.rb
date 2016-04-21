class MessagesController < ApplicationController
	before_action :find_message, only: [:show,:edit,:update,:destroy]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]
	def index
		@messages=Message.all.order("created_at DESC").paginate(page: params[:page],per_page: 9)
	end
	def new
		@message=current_admin.messages.build
	end
	def create
		@message=current_admin.messages.build(params_message)

		if @message.save
			redirect_to messages_path
		else
			render 'new'
		end
	end

	def show
		admin_message=@message.admin_id
		@admin=Admin.find(admin_message)

		
			

	end

	def edit
	end

	def update
		if @message.update(params_message)
			redirect_to message_path(@message)
		else
			render 'edit'
		end
	end

	def destroy
		if @message.destroy
			redirect_to root_path
		end
	end

	private
	def params_message
		params.require(:message).permit(:title,:description)
	end
	def find_message
		@message=Message.find(params[:id])
	end
	def ensure_admin
 unless current_admin.id==@message.admin_id 
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin 
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end
end
