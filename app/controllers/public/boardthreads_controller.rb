class Public::BoardthreadsController < ApplicationController
  def new
  end

  def create
    board = Board.find(params[:boardthread][:id])
    @boardthread = Boardthread.new(boardthread_params)
    @boardthread.board_id = board.id
    @boardthread.user_id = current_user.id
    @boardthread.save
      redirect_to public_board_path(board)
  end

  def show
    @post_comment = PostComment.new
  end

  def index
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def boardthread_params
    params.require(:boardthread).permit(:title, :body, :user_id, :category, :board_id)
  end
end
