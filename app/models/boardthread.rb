class Boardthread < ApplicationRecord
    belongs_to :Board, dependent: :destroy
    belongs_to :User, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 1000}
end
