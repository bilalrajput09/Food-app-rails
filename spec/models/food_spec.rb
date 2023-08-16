# spec/models/food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it { should have_many(:inventory_foods) }
    it { should have_many(:recipe_foods) }
  end
end
