class Public::UsersController < ApplicationController
    def show
        @user = current_user

        bookmark_ids = Bookmark.where(user_id: current_user.id).pluck(:bookmarkable_id)
        @bookmark_review_list = Review.where(id: bookmark_ids)
        @bookmark_boardthread_list = Boardthread.where(id: bookmark_ids)
    end
    
    def edit
        @user = current_user
    end
    
    def update
        @user = current_user
        @user.update(user_params)
        redirect_to public_users_mypage_path
    end
    
    def withdraw
        @user = User.find(current_user.id)
        @user.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行しました"
        redirect_to public_tagsearches_search_path
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :encrypted_password, :profile_image)
    end
    
end
