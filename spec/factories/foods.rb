# spec/factories/foods.rb
FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    measurement_unit { Faker::Food.metric_measurement }
    price { Faker::Number.between(from: 1, to: 100) }
  end
end
