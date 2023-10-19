class Boardthread < ApplicationRecord
    belongs_to :Board, dependent: :destroy
    belongs_to :User
    
    validates :title, presence: true
    validates :body, presence: true
end
