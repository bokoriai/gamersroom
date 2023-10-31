class Favorite < ApplicationRecord
    belongs_to :favorable, polymorphic: true
    belongs_to :user
    
    validates :user_id, uniqueness: {scope: :favorable_id}
end
