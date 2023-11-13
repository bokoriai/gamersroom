class Public::GamesearchesController < ApplicationController
    def search
        @model = params[:model]
        @content = params[:content]
        @method = params[:method]
        
        @games = Game.search_for(@content, @method)
    end
end
