class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :review
    belongs_to :boardthread
    
end
