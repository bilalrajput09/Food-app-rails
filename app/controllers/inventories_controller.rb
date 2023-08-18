class InventoriesController < ApplicationController
  # before_action :authenticate_user! # Ensure user is logged in

  def index
    @inventories = Inventory.all
  end

  def new; end

  def create
    inventory = Inventory.new(name: params[:name])

    if current_user.inventories << inventory
      flash[:notice] = 'The inventory is created successfully'
      redirect_to root_path
    else
      flash.now = 'The inventory has not created'
      render 'new'
    end
  end

  def show
    @inventory = Inventory.includes(:inventory_foods).find(params[:id])
  end

  def destroy
    inventory_food = InventoryFood.find_by(food_id: params[:food_id])
    if inventory_food.destroy
      redirect_to inventory_path(inventory_id: params[:inventory_id])
    else
      render 'show'
    end
  end

  def inventory_destroy
    inventory = Inventory.find(params[:inventory_id])
    if inventory.destroy
      flash[:notice] = 'Inventory deleted successfully'
      redirect_to root_path
    else
      flash.now = 'Inventory is not deleted'
      render 'index'
    end
  end
end
