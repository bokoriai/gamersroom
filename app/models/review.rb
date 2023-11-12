class Review < ApplicationRecord
  
    belongs_to :user
    belongs_to :genre
    belongs_to :game
    has_many :post_comments, as: :post_commentable
    has_many :favorites, as: :favorable
    has_many :bookmarks, as: :bookmarkable
    
    validates :title, presence: true
    validates :body, presence: true
    
    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    
    def bookmarked_by?(user)
        bookmarks.exists?(user_id: user.id)
    end

end
