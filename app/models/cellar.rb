class Cellar < ApplicationRecord
  belongs_to :user
  has_many :stashes, dependent: :destroy
  has_many :bottles, through: :stashes
end
