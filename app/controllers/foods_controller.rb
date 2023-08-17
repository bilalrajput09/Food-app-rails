class FoodsController < ApplicationController
  def new; end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    inventory_food = InventoryFood.find_by(food_id: params[:food_id])
    recipe_food = RecipeFood.find_by(food_id: params[:food_id])
    food = Food.find(params[:food_id])
    if food.destroy && inventory_food.destroy && recipe_food.destroy
      redirect_to inventory_path(params[:inventory_id])
    else
      redirect_to root_path
    end
  end

  def create
    food = Food.new(food_params)
    if params[:inventory_id]
      add_food_to_inventory_foods(params, food)
    else
      add_food_to_recipe_foods(params, food)
    end
  end

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end

  def add_food_to_inventory_foods(params, food)
    inventory = Inventory.find(params[:inventory_id])
    inventory_food = InventoryFood.new(quantity: params[:quantity])
    if food.save

      food.inventory_foods << inventory_food
      inventory.inventory_foods << inventory_food

      redirect_to inventory_path(params[:inventory_id])
    else
      render 'new'
    end
  end

  def add_food_to_recipe_foods(params, food)
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new(quantity: params[:quantity])
    if food.save
      food.recipe_foods << recipe_food
      recipe.recipe_foods << recipe_food

      redirect_to recipe_path(params[:recipe_id])
    else
      render 'new'
    end
  end
end
