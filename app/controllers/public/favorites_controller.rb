class Public::FavoritesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(favorable_id: review.id)
    favorite.save
    redirect_to public_review_path(review)
  end

  def destroy
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(favorable_id: review.id)
    favorite.destroy
    redirect_to public_review_path(review)
  end
end
