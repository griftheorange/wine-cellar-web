class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :cellars, dependent: :destroy
    
end
