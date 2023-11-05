class Admin::PostCommentsController < ApplicationController
    def create
        if params[:review_id].present?
            review = Review.find(params[:review_id])
            comment = review.post_comments.new(post_comment_params)
            comment.user_id = current_user.id
            comment.save
            redirect_to admin_review_path(review)
        else
            boardthread = Boardthread.find(params[:boardthread_id])
            comment = boardthread.post_comments.new(post_comment_params)
            comment.user_id = current_user.id
            comment.save
            redirect_to admin_boardthread_path(boardthread)
        end
    end
    
    def destroy
        if params[:review_id].present?
            PostComment.find(params[:id]).destroy
            redirect_to admin_review_path(params[:review_id])
        else
            PostComment.find(params[:id]).destroy
            redirect_to admin_boardthread_path(params[:boardthread_id])
        end
    end
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment, :review_id, :user_id, :boardthread_id)
    end
     
end
