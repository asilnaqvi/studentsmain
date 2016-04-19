class CommentsController < ApplicationController
	before_action :find_message, only: [:show,:edit,:update,:destroy,:upvote]
	before_action :find_comment, only: [:edit,:update,:destroy,:upvote]
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
end
