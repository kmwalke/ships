class Component < ApplicationRecord
  # belongs_to :ship, optional: true
  has_and_belongs_to_many :ships

  validates :name, presence: true#, uniqueness: true
  validates :affect, presence: true
end
