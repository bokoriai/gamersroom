class Favorite < ApplicationRecord
    belongs_to :favorable, polymorphic: true
    
    validates :user_id, uniqueness: {scope: :favorable_id}
end
