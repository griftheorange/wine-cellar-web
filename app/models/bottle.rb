class Bottle < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :stashes, dependent: :destroy
    has_many :cellars, through: :stashes
    
end
