class Public::BoardthreadsController < ApplicationController
  def new
  end

  def create
    @boardthread = Boardthread.new(boardthread_params)
    @boardthread.user_id = current_user.id
    @boardthread = board.id
    @boardthread.save
      redirect_to public_board_path(boardthread)
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
