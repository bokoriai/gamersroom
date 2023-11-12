class Public::GamesController < ApplicationController
    def index
        @games = Game.all.order(:game_title)
    end
end
