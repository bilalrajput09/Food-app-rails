# spec/factories/foods.rb
FactoryBot.define do
  factory :food do
    name { Faker::Food.unique.ingredient }
    measurement_unit { Faker::Food.metric_measurement }
    price { Faker::Number.between(from: 1, to: 100) }
  end
end
