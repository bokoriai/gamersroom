class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post_commentable, polymorphic: true
end
