class Public::BoardsController < ApplicationController
    def index
        @boards = Board.all
    end
    
    def show
    end
    
    def new
        @board = Board.new
    end
    
    def create
        @board = Board.new(board_params)
        if @board.save
            redirect_to public_board_path(@board)
        else
            @boards = Board.all
            render :index
        end
    end
    
    private
    def board_params
        params.require(:board).permit(:title)
    end
end
