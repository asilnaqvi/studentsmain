class CommentsController < ApplicationController
	before_action :find_message, only: [:show,:edit,:update,:destroy,:upvote]
	before_action :find_comment, only: [:edit,:update,:destroy,:upvote]
	before_filter :ensure_admin, only: [:edit,:destroy]
	before_filter :ensure_new_admin, only: [:new]
	def new
	end
	def create
		@message=Message.find(find_message)
		@comment=@message.comments.create(params_comment)
		@comment.admin_id=current_admin.id

		if @comment.save
			redirect_to message_path(@message)
		else
			render 'new'
		end
	end
	def edit
	end
	def update

if @comment.update(params_comment)
			redirect_to message_path(@message)
		else
			render 'edit'
		end
			end
	def destroy
		if @comment.destroy
			redirect_to message_path(@message)
		end
	end
	def upvote
		@comment.upvote_by current_admin
		redirect_to :back 
	end
	private
def params_comment
		params.require(:comment).permit(:content)
	end
	def find_message
		@message=Message.find(params[:message_id])
	end
	def find_comment
		@comment=@message.comments.find(params[:id])
	end
		def ensure_admin
 unless current_admin.id==@comment.admin_id 
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end

def ensure_new_admin
 unless current_admin 
   render :text => "You are not authorised to perform this action", :status => :unauthorized
 end
end
end
