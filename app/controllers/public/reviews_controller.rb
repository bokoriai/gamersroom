class Public::ReviewsController < ApplicationController
    def index
        if params[:latest]
            @reviews = Review.latest
        elsif params[:old]
            @reviews = Review.old
        else
            @reviews = Review.all
        end
        
        @review = Review.new
    end
    
    def show
        @review = Review.find(params[:id])
        @post_comment = PostComment.new
    end

    def create
        @review = Review.new(review_params)
        @review.score = Language.get_data(review_params[:body])
        @review.user_id = current_user.id
        if @review.game_title.nil?
            redirect_to new_game_title_path(review_params[:game_title])
        else
            if @review.save
                redirect_to public_reviews_path
            else
                @reviews = Review.all
                render :index
            end
        end
    end

    def gametitlenew
        @review = Review.new(game_title_params)
        if @review.save(validate: false)
            redirect_to public_reviews_path
        else
            @reviews = Review.all
            render :index
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
        params.require(:review).permit(:title, :body, :star, :category, :genre_id, :score)
    end
    
    def game_title_params
        params.require(:review).permit(:game_title)
    end
end