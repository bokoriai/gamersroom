class Game < ApplicationRecord
    has_many :reviews
    
    scope :star_count, -> {order(star: :desc)}
    scope :title_sort, -> {order(game_title: :desc)}
    
    def self.search_for(content, method)
        if method == 'perfect'
            Game.where(game_title: content)
        else
            Game.where('game_title LIKE ?', '%' + content + '%')
        end
    end
end
