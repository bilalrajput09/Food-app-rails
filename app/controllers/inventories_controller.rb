class InventoriesController < ApplicationController
  # before_action :authenticate_user! # Ensure user is logged in

  def index
    @user = User.first
    @inventories = @user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    inventory_food = InventoryFood.find_by(inventory_id: params[:inventory_id])
    if inventory_food.destroy 
      redirect_to inventory_path(inventory_id: params[:inventory_id])
    else
      render "show"
    end
  end
end
