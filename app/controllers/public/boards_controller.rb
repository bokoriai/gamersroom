class Public::BoardsController < ApplicationController
    def new
        @board = Board.new
    end
    
    def create
        @board = Board.new(board_params)
        if @board.save
            redirect_to public_boards_path
        else
            render :new
        end
    end
    
    def index
        @boards = Board.all
    end
    
    def show
    end
    
    private
    def board_params
        params.require(:board).permit(:title, :body, :user_id, :category)
    end
end
