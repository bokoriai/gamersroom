class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def top
    end
    
    private
    def authenticate_admin!
        unless current_user.email == ENV['ADMIN_EMAIL']
            redirect_to root_path
        end
    end
end
