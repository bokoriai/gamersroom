class Public::TagsearchesController < ApplicationController
    def search
        @model = Boardthread
        @word = params[:content]
        @boardthreads = Boardthread.where("category LIKE?","%#{@word}%")
    end
end
