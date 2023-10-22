class Favorite < ApplicationRecord
    belongs_to :favorable, polymorphic: true
    
    validates :user_id, uniqueness: {scope: :post_image_id}
end
