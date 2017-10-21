FactoryBot.define do
  factory :ship do
    name { Faker::StarWars.vehicle }
    color { Faker::Color.color_name }
  end
end