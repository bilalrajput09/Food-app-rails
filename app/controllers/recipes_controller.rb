class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def shopping_list
    @inventory_obj = Inventory.find(params[:selected_inventory_id])
    @recipe_obj = Recipe.find(params[:recipe_id])

    @inventory_foods_ids = @inventory_obj.inventory_foods.pluck(:food_id)
    # id: 1, 5

    @missing_foods = @recipe_obj.recipe_foods.reject do |recipe_food|
      @inventory_foods_ids.include?(recipe_food.food.id)
    end
    @price = 0
    @total_value = @missing_foods.each do |missing_food|
      @price += missing_food.food.price
    end
    @price
  end

  def toggle_recipes_status
    @recipe = Recipe.find(params[:recipe_id])
    if params[:recipe][:public] == '1'
      @recipe.update(public: true)
    else
      @recipe.update(public: false)
    end
    render 'show'
  end
end
