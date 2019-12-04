class User < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :cellars, dependent: :destroy

    validates :username, presence: {message: "You need a username."}
    validates :password, presence: {message: "You need a password."}

    
end
