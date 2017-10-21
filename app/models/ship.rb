class Ship < ApplicationRecord
  # has_many :components, dependent: :destroy
  has_and_belongs_to_many :components

  validates :name, presence: true#, uniqueness: true
  validates :color, presence: true
end
