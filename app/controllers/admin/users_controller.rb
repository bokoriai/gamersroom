class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    
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
    
    def authenticate_admin!
        unless current_user.email == ENV['ADMIN_EMAIL']
            redirect_to root_path
        end
    end
end
