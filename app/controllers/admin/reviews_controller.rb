class Admin::ReviewsController < ApplicationController
    def index
        now = Time.current
        @reviews = Review.where(created_at: now.prev_day...now).order(created_at: :desc)
    end
    
    def show
        @review = Review.find(params[:id])
    end
    
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to admin_reviews_path
    end
    
    private
    def review_params
        params.require(:review).permit(:title, :body, :star, :category, :genre_id, :score)
    end
    
end
