class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  scope :public_recipes, -> { where(public: true) }
end
