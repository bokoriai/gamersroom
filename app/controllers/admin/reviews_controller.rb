class Admin::ReviewsController < ApplicationController
    def index
        now = Time.current
        @reviews = Review.where(created_at: now.prev_day...now).order(created_at: :desc)
    end
    
    def show
    end
end
