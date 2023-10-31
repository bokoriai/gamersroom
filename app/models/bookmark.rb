class Bookmark < ApplicationRecord
    belongs_to :bookmarkable, polymorphic: true
    belongs_to :user
    
    validates :user_id, uniqueness: {scope: :bookmarkable_id}
end
