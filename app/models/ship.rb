class Ship < ApplicationRecord
  has_many :components, dependent: :destroy

  validates :name, presence: true#, uniqueness: true
  validates :color, presence: true
end
