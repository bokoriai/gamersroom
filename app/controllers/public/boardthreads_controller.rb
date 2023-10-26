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
    @boardthread = Boardthread.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    
  end

  def edit
    @boardthread = Boardthread.find(params[:id])
  end

  def update
    @boardthread = Boardthread.find(params[:id])
    if @boardthread.update(boardthread_params)
      redirect_to public_boardthread_path(@boardthread.id)
    else
      render :edit
    end
  end

  def destroy
    @boardthread = Boardthread.find(params[:id])
    @boardthread.destroy
    redirect_to public_boardthreads_path
  end
  
  def boardthread_params
    params.require(:boardthread).permit(:title, :body, :user_id, :category, :board_id)
  end
end
