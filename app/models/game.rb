class Game < ApplicationRecord
    has_many :reviews

    def self.search_for(content, method)
        if method == 'perfect'
            Game.where(name: content)
        else
            Game.where('name LIKE ?', '%' + content + '%')
        end
    end
end
