class Cellar < ApplicationRecord
  belongs_to :user
  has_many :stashes, dependent: :destroy
  has_many :bottles, through: :stashes

  validates :name, presence: {message: "You need a name for your cellar"}
  validates :description, presence: {message: "You need a description for your cellar, even if it's a single letter :p"}
  validates :name, uniqueness: {scope: :user_id, message: "You can't have more than one cellar of the same name"}

  def self.average_size
    Cellar.all.map{|cellar| cellar.bottles.length}.reduce(0, :+)/(Cellar.all.length.to_f)
  end
end
