class BoardsController < ApplicationController
	before_action :find_board, only: [:show,:edit,:update,:destroy]
	def index
	@boards=Board.all.order("created_at DESC")	
	end
	def new
		@board=Board.new
	end

	def create
	@board=Board.new(params_board)

	if @board.save
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
		if @board.update(find_board)
			redirect_to school_path(@board)
		else
			render 'edit'
		end
	end

	def destroy
		if @board.destroy
			redirect_to root_path
		end
	end
	
	private
	def params_board
		params.require(:board).permit(:name)
	end
	def find_board
		@board=Board.find(params[:id])
	end
end
