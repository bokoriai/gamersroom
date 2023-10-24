class Public::PostCommentsController < ApplicationController
    def create
        if params[:review_id].present?
            review = Review.find(params[:review_id])
            comment = review.post_comments.new(post_comment_params)
            comment.user_id = current_user.id
            comment.save
            redirect_to public_review_path(review)
        else
            boardthread = Boardthread.find(params[:boardthread_id])
            comment = boardthread.post_comments.new(post_comment_params)
            comment.user_id = current_user.id
            comment.save
            redirect_to public_boardthread_path(boardthread)
        end
    end
    
    
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment, :review_id, :user_id, :boardthread_id)
    end
        
end
