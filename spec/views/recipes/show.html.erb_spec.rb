# spec/views/recipes/show.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'recipes/show.html.erb', type: :view do
  include Devise::Test::ControllerHelpers
  before do
    @recipe = FactoryBot.build_stubbed(:recipe, name: 'Recipe 1', preparation_time: '30 minutes',
                                                cooking_time: '45 minutes', description: 'Description 1', public: true)
    recipe_food = FactoryBot.build_stubbed(:recipe_food,
                                           food: FactoryBot.build_stubbed(:food, name: 'Food Item', price: 10),
                                           quantity: 2)
    allow(@recipe).to receive(:recipe_foods).and_return([recipe_food])
    inventories = [
      FactoryBot.build_stubbed(:inventory, id: 1, name: 'Inventory 1'),
      FactoryBot.build_stubbed(:inventory, id: 2, name: 'Inventory 2')
    ]
    assign(:inventories, inventories)
    render
  end

  it 'displays the recipe details' do
    expect(rendered).to have_selector('h1.display-4', text: 'Recipe 1')

    expect(rendered).to have_selector('h5', text: 'Cooking Time:')
    expect(rendered).to have_selector('h5', text: 'Description:')

    expect(rendered).to have_selector('button[type="button"][data-bs-toggle="modal"][data-bs-target="#exampleModal"]',
                                      text: 'Generate shopping list')

    expect(rendered).to have_selector('div.modal-dialog')
    expect(rendered).to have_selector('select.form-select')

    expect(rendered).to have_selector('table.table.mb-4.table-striped.table-bordered')
    expect(rendered).to have_selector('thead th', text: 'Serial#')
    expect(rendered).to have_selector('thead th', text: 'Food')
    expect(rendered).to have_selector('thead th', text: 'Quantity')
    expect(rendered).to have_selector('thead th', text: 'Value')
    expect(rendered).to have_selector('thead th', text: 'Actions')

    expect(rendered).to have_selector('tbody tr', count: 1)
    expect(rendered).to have_selector('tbody td', text: '1')
    expect(rendered).to have_selector('tbody td', text: 'Food Item')
    expect(rendered).to have_selector('tbody td', text: '2')
  end
end
