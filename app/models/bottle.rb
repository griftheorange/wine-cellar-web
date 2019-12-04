class Bottle < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :stashes, dependent: :destroy
    has_many :cellars, through: :stashes
    
    def bottle_string
        "#{self.brand}, #{self.wine_type}, Year: #{self.year}"
    end
end
