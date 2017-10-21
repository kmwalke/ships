class Component < ApplicationRecord
  has_and_belongs_to_many :ships

  validates :name, presence: true#, uniqueness: true
  validates :affect, presence: true
end
