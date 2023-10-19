class Board < ApplicationRecord
    belongs_to :user
    #has_many :threads, dependend: :destroy
    
    validates :title, presence: true
    
end
