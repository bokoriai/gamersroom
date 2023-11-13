class Admin::BoardthreadsController < ApplicationController
    def index
        now = Time.current
        @boardthreads = Boardthread.where(created_at: now.prev_week...now).order(created_at: :desc)
    end
    
    def show
        @boardthread = Boardthread.find(params[:id])
    end
    
    def destroy
        @boardthread = Boardthread.find(params[:id])
        @boardthread.destroy
        redirect_to admin_boardthreads_path
    end
    
    private
    def boardthread_params
        params.require(:boardthread).permit(:title, :body, :category, :score)
    end
        
end
