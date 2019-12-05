class Review < ApplicationRecord
  belongs_to :bottle
  belongs_to :user

  validates :bottle_id, uniqueness: {scope: :user_id, message: "You can't have more than one review of the same bottle"}
  validates :rating, presence: true, inclusion: 1..5
  validates :content, presence: true, length: {minimum: 2}
end
