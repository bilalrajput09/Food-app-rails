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
    @inventory = Inventory.find(params[:id])
    # Delete the inventory logic here
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory was successfully deleted.'
  end
end
