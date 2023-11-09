class Public::GenresearchesController < ApplicationController
    def search
        @model = Review
        @word = params[:content]
        @reviews = Review.joins(:genre).where("genres.name LIKE ?", "%#{@word}%")
    end
end
