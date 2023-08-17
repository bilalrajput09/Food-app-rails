class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def recipe_destroy
    recipe = Recipe.find(params[:recipe_id])
    if recipe.destroy
      flash[:notice] = 'Recipe deleted successfully'
      redirect_to recipes_path
    else
      flash.now = 'Recipe is not deleted'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.all
  end

  def shopping_list
    @inventory_obj = Inventory.find(params[:selected_inventory_id])
    @recipe_obj = Recipe.find(params[:recipe_id])

    food_names_from_inventory = @inventory_obj.inventory_foods.map do |inventory_food|
      inventory_food.food.name.downcase
    end

    @missing_foods = @recipe_obj.recipe_foods.reject do |recipe_food|
      food_names_from_inventory.include?(recipe_food.food.name.downcase)
    end

    @total_price = 0
    @total_value = @missing_foods.each do |missing_food|
      price_multiply_with_qty = missing_food.food.price * missing_food.quantity
      @total_price += price_multiply_with_qty
    end
    @total_price
  end

  def toggle_recipes_status
    @inventories = Inventory.all
    @recipe = Recipe.find(params[:recipe_id])
    if params[:recipe][:public] == '1'
      @recipe.update(public: true)
    else
      @recipe.update(public: false)
    end
    render 'show'
  end

  def destroy
    recipe_food = RecipeFood.find_by(food_id: params[:food_id])
    if recipe_food.destroy
      redirect_to recipe_path(id: params[:id])
    else
      render 'show'
    end
  end
end
