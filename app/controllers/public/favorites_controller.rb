class Public::FavoritesController < ApplicationController
  def create
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      favorite = @review.favorites.new
      favorite.user_id = current_user.id
      favorite.save
    else
      #boardthreadのいいねを作成
    end
  end

  def destroy
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      favorite = @review.favorites.find_by(favorable_id: @review.id, favorable_type: "Review")
      favorite.destroy
    else
      #boardthreadのいいねを削除
    end
  end
  
end
