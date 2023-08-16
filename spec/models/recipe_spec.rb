require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
  end

  describe "scopes" do
    describe '.public_recipes' do
      it 'returns recipes with public flag set to true' do
        public_recipe = create(:recipe, public: true)
        private_recipe = create(:recipe, public: false)

        public_recipes = Recipe.public_recipes
        expect(public_recipes).to include(public_recipe)
        expect(public_recipes).not_to include(private_recipe)
      end
    end
  end
end
