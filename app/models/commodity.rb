class Commodity < ApplicationRecord
  has_and_belongs_to_many :planets
  has_and_belongs_to_many :ships
end
