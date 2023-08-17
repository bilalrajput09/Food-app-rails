# spec/factories/inventories.rb
FactoryBot.define do
  factory :inventory do
    name { Faker::Commerce.unique.department }
    association :user
  end
end
