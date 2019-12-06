class Bottle < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :stashes, dependent: :destroy
    has_many :cellars, through: :stashes

    validates :brand, :wine_type, :color, :year, presence: true
    validates :year, inclusion: {in: 300..(Time.now.strftime("%Y").to_i), message: "Can't be earlier than 300AD or later than the present."}
    validates :brand, uniqueness: {scope: [:wine_type, :color, :year], message: "Can't duplicate", case_sensitive: false}
    
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

    #array of tied highest rated bottles
    def self.highest_rated
            Bottle.all.sort_by{|bottle| bottle.average_rating}.reverse
    end

    def average_rating
        if self.reviews.empty?
            0
        else
            self.reviews.map{|review| review.rating}.reduce(0, :+)/(self.reviews.length.to_f)
        end
    end

    #array of most reviewed bottles
    def self.most_reviewed
        Bottle.all.sort_by{|bottle| bottle.reviews.length}.reverse
    end

    #array of bottles with the most cellars
    def self.most_cellars
        Bottle.all.sort_by{|bottle| bottle.cellars.length}.reverse
    end

    def average_review_length
        self.reviews.map{|review| review.content.length}.reduce(0, :+)/(self.reviews.length.to_f)
    end

end
