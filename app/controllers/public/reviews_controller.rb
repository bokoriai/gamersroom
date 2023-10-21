class Public::ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        @newreview = Review.new
    end
    
    def show
    end
    
    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        if @review.save
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
        params.permit(:title, :body, :star, :category)
    end
    
end
