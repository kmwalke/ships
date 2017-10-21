class Component < ApplicationRecord
  belongs_to :ship, optional: true

  validates :name, presence: true#, uniqueness: true
  validates :affect, presence: true
end
