class Review < ApplicationRecord
  belongs_to :bottle
  belongs_to :user
end
