class Public::GamesearchesController < ApplicationController
    def search
        @model = params[:model]
        @content = params[:content]
        @method = params[:method]
        
        @records = Game.search_for(@content, @method)
    end
end
