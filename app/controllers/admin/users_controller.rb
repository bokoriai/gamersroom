class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :encrypted_password, :profile_image)
    end
end
