class Bottle < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :stashes, dependent: :destroy
    has_many :cellars, through: :stashes
    
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

class String
    def drop_type
        self.itself.gsub(/[_-]/, ' ').split(' ').map(&:capitalize).join(' ')
    end
end
