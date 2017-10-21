class Planet < ApplicationRecord
  has_and_belongs_to_many :commodities
  has_many :ships
end
