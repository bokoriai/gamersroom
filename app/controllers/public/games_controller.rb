class Public::GamesController < ApplicationController
    def index
        @top_rated_games = Game.joins(:reviews).group("games.id").order("AVG(reviews.star) DESC").limit(5).distinct
        now = Time.current
        @recent_reviews = Game.joins(:reviews).where(created_at: now.prev_week...now).order(created_at: :desc).distinct
    end
    
    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to public_games_path
        else
            @top_rated_games = Game.joins(:reviews).group("games.id").order("AVG(reviews.star) DESC").limit(5).distinct
            now = Time.current
            @recent_games = Game.joins(:reviews).where(created_at: now.prev_week...now).order(created_at: :desc).distinct
            render :index
        end
    end
    
    private
    def game_params
        params.permit(:game_title)
    end
end
