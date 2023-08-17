# spec/factories/recipes.rb
FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { "#{Faker::Number.between(from: 5, to: 60)} minutes" }
    cooking_time { "#{Faker::Number.between(from: 10, to: 120)} minutes" }
    description { Faker::Lorem.sentence }
    public { true }
    association :user
  end
end
