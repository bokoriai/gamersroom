class Bookmark < ApplicationRecord
    belongs_to :bookmarkable, polymorphic: true
    belongs_to :user
    
    scope :by_type, ->(type) {where(bookmarkable_type: type)}
    scope :by_reviews, -> {by_type("Review") }
    scope :by_boardthreads, -> {by_type("Boardthread") }
    
    validates :user_id, uniqueness: {scope: [:bookmarkable_id, :bookmarkable_type]}
    
    # def self.get_ids_by_type(type, user_id)
    #   Bookmark.send(:"by_#{type.downcase}s").where(user_id: user_id).pluck(:bookmarkable_id)
    # end
end
