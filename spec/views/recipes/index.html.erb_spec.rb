# spec/views/recipes/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  include Devise::Test::ControllerHelpers
  before do
    recipes = [
      FactoryBot.build_stubbed(:recipe, name: 'Recipe 1', description: 'Description 1'),
      FactoryBot.build_stubbed(:recipe, name: 'Recipe 2', description: 'Description 2')
    ]
    assign(:recipes, recipes)
    render
  end

  it 'displays the list of recipes' do
    expect(rendered).to have_selector('h1.text-center.py-4', text: 'Recipes list')

    expect(rendered).to have_selector('div.card.border-secondary.mb-2', count: 2)

    expect(rendered).to have_selector('h5.card-title a', text: 'Recipe 1')
    expect(rendered).to have_selector('h5.card-title a', text: 'Recipe 2')

    expect(rendered).to have_selector("form[method='post'] input[type='submit'][value='REMOVE']", count: 0)

    expect(rendered).to have_selector('p.text-dark', text: 'Description 1')
    expect(rendered).to have_selector('p.text-dark', text: 'Description 2')
  end
end
