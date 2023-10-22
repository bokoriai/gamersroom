class Boardthread < ApplicationRecord
    belongs_to :Board, dependent: :destroy
    belongs_to :User, dependent: :destroy
    has_many :post_comments, as: :post_commentable
    has_many :favorites, as: :favorable
    validates :title, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 1000}
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
