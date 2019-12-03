class Stash < ApplicationRecord
  belongs_to :bottle
  belongs_to :cellar
end
