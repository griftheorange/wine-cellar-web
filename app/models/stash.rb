class Stash < ApplicationRecord
  belongs_to :bottle
  belongs_to :cellar

  validates :bottle_id, uniqueness: {scope: :cellar_id}
end
