class Review < ApplicationRecord
    belongs_to :user
    has_many :post_comments, as: :post_commentable
    validates :title, presence: true
    validates :body, presence: true
    
end
