class Review < ApplicationRecord
  belongs_to :bottle
  belongs_to :user

  validates :bottle_id, uniqueness: true
  validates :rating, presence: true, inclusion: 1..5
  validates :content, presence: true, length: {minimum: 2}
end
