require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many inventories' do
    association = described_class.reflect_on_association(:inventories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq(:has_many)
  end
end
