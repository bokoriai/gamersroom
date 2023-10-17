class Board < ApplicationRecord
    belongs_to :user
    #has_many :threads, dependend: :destroy
end
