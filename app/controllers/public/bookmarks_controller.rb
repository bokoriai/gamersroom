class Public::BookmarksController < ApplicationController
  def create
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      bookmark = @review.bookmarks.new
      bookmark.user_id = current_user.id
      bookmark.save
    else
      @boardthread = Boardthread.find(params[:boardthread_id])
      bookmark = @boardthread.bookmarks.new
      bookmark.user_id = current_user.id
      bookmark.save
    end
  end

  def destroy
    if params[:review_id].present?
      @review = Review.find(params[:review_id])
      bookmark = @review.bookmarks.find_by(bookmarkable_id: @review.id, bookmarkable_type: "Review")
      bookmark.destroy
    else
      @boardthread = Boardthread.find(params[:boardthread_id])
      bookmark = @boardthread.bookmarks.find_by(bookmarkable_id: @boardthread.id, bookmarkable_type: "Boardthread")
      bookmark.destroy
    end
  end
  
end


