class Public::ReviewsController < ApplicationController
    def index
        @game = Game.find(params[:game_id])
        if params[:latest]
            @reviews = @game.reviews.latest
        elsif params[:old]
            @reviews = @game.reviews.old
        else
            @reviews = @game.reviews
        end
        @review = Review.new
    end
    
    def show
        @review = Review.find(params[:id])
        @post_comment = PostComment.new
    end

    def create
        @game = Game.find(params[:review][:game_id])
        @review = Review.new(review_params)
        @review.score = Language.get_data(review_params[:body])
        @review.game_id = params[:review][:game_id]
        @review.user_id = current_user.id
        if @review.save
            redirect_to public_reviews_path(game_id: @game.id)
        else                
            @reviews = @game.reviews
            redirect_to public_reviews_path(game_id: @game.id)
        end
    end

    def edit
        @review = Review.find(params[:id])
    end
    
    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to public_review_path(@review) ,notice: "You have updated review successfully."
        else
            render :edit
        end
    end
    
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to public_reviews_path
    end
    
    private
    def review_params
        params.require(:review).permit(:title, :body, :star, :category, :genre_id, :score, :game_id)
    end

end