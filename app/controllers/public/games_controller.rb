class Public::GamesController < ApplicationController
    def index
        @top_rated_games = Game.joins(:reviews).group("games.id").order("AVG(reviews.star) DESC").limit(10)
        @recent_reviews = Game.joins(:reviews).where("reviews.created_at > ?", Time.now - 1.week)
    end
    
    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to public_games_path
        else
            @top_rated_games = Game.joins(:reviews).group("games.id").order("AVG(reviews.star) DESC").limit(10)
            @recent_reviews = Game.joins(:reviews).where("reviews.created_at > ?", Time.now - 1.week)
            render :index
        end
    end
    
    private
    def game_params
        params.permit(:game_title)
    end
end
