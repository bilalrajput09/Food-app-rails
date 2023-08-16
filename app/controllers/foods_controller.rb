class FoodsController < ApplicationController
  def new; end

  def create
    food = Food.new(food_params)
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

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end
end
