FactoryBot.define do
  factory :component do
    name { Faker::StarWars.character }
    affect { Faker::Superhero.power }
    association :ship
  end
end
