class Ship < ApplicationRecord
  has_and_belongs_to_many :components
  has_and_belongs_to_many :commodities
  belongs_to :planet

  validates :name, presence: true#, uniqueness: true
  validates :color, presence: true
end
