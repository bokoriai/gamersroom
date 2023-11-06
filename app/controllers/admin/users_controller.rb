class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "ユーザーを削除しました"
        redirect_to admin_users_path
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :encrypted_password, :profile_image)
    end
end
