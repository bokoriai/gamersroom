class Public::FavoritesController < ApplicationController
  def create
    #if params[:review_id].present?
      #reviewのいいねを作成
    #else
      #boardthreadのいいねを作成
    #end
    @review = Review.find(params[:review_id])
    #favorite = current_user.favorites.new(favorable_id: @review.id, favorable_type: "Review")
    favorite = @review.favorites.new
    favorite.user_id = current_user.id
    
    #comment = review.post_comments.new(post_comment_params)
    #comment.user_id = current_user.id
    favorite.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(favorable_id: @review.id, favorable_type: "Review")
    favorite.destroy
  end
end
