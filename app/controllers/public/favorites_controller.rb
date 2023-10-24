class Public::FavoritesController < ApplicationController
  def create
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      favorite = @review.favorites.new
      favorite.user_id = current_user.id
      favorite.save
    else
      @boardthread = Boardthread.find(params[:boardthread_id])
      favorite = @boardthread.favorites.new
      favorite.user_id = current_user.id
      favorite.save
    end
  end

  def destroy
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      favorite = @review.favorites.find_by(favorable_id: @review.id, favorable_type: "Review")
      favorite.destroy
    else
      @boardthread = Boardthread.find(params[:boardthread_id])
      favorite = @boardthread.favorites.find_by(favorable_id: @boardthread.id, favorable_type: "Boardthread")
      favorite.destroy
    end
  end
  
end
