class Board < ApplicationRecord
    belongs_to :user
    has_many :boardthreads, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 100 }

end
