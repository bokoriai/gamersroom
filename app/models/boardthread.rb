class Boardthread < ApplicationRecord
  
    def self.tagsearch_for(word, method)
        if method == 'perfect'
            Boardthread.where(name: word)
        elsif method == 'forward'
            Boardthread.where('name LIKE ?', word + '%')
        elsif method == 'backward'
            Boardthread.where('name LIKE ?', '%' + word)
        else
            Boardthread.where('name LIKE ?', '%' + word + '%')
        end
    end
  
    belongs_to :board, dependent: :destroy
    belongs_to :user, dependent: :destroy
    has_many :post_comments, as: :post_commentable
    has_many :favorites, as: :favorable
    
    validates :title, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 1000}
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
