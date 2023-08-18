require 'rails_helper'

RSpec.describe 'recipes/shopping_list.html.erb', type: :view do
  include Devise::Test::ControllerHelpers

  before do
    user = FactoryBot.create(:user)
    sign_in(user) # Sign in the user

    missing_foods = [
      Struct.new(:food, :quantity).new(
        Struct.new(:name, :price).new('Food Item', 10),
        5
      )
    ]
    assign(:missing_foods, missing_foods)
    assign(:recipe_obj, Struct.new(:name).new('Recipe Name'))
    assign(:total_price, 25) # Set a sample total price
    assign(:inventory_obj, Struct.new(:name).new('Inventory Name'))
    render
  end

  it 'displays the shopping list' do
    expect(rendered).to have_selector('h1.display-4', text: 'Shopping List')

    expect(rendered).to have_selector('h5', text: 'Amount of food to buy:')
    expect(rendered).to have_selector('h5', text: 'Total value of food needed:')

    expect(rendered).to have_selector('table.table.mb-4.table-striped.table-bordered')
    expect(rendered).to have_selector('thead th', text: 'Serial#')
    expect(rendered).to have_selector('thead th', text: 'Food')
    expect(rendered).to have_selector('thead th', text: 'Quantity')
    expect(rendered).to have_selector('thead th', text: 'Price')

    expect(rendered).to have_selector('tbody tr', count: 1)
    expect(rendered).to have_selector('tbody td', text: '1')
    expect(rendered).to have_selector('tbody td', text: 'Food Item')
    expect(rendered).to have_selector('tbody td', text: '5')
    expect(rendered).to have_selector('tbody td', text: '$50') # Adjusted to calculate the price
  end
end
