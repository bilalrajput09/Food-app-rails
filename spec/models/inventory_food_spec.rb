require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  describe 'associations' do
    it { should belong_to(:inventory) }
    it { should belong_to(:food) }
  end
end
