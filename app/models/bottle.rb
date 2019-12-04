class Bottle < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :stashes, dependent: :destroy
    has_many :cellars, through: :stashes

    validates :brand, :wine_type, :color, :year, presence: true
    validates :year, inclusion: {in: 300..(Time.now.strftime("%Y").to_i), message: "Can't be earlier than 300AD or later than the present."}
    validates :brand, uniqueness: {scope: [:wine_type, :color, :year], message: "Can't duplicate"}
    
    def bottle_string
        "#{self.brand}, #{self.wine_type}, Year: #{self.year}"
    end

    def self.select_column_names
        Bottle.column_names.select{|name|
            !["id", "created_at", "updated_at"].include?(name)
        }
    end

    def self.uniq_attributes(attr)
        Bottle.all.map{|bottle|
            bottle.send(attr)
        }.uniq
    end
end
