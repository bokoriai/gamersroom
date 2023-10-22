class Review < ApplicationRecord
    belongs_to :user
    has_many :post_comments, as: :post_commentable
    has_many :favorites, as: :favorable
    validates :title, presence: true
    validates :body, presence: true
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    
end
