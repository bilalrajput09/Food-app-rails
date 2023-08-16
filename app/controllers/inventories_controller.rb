class InventoriesController < ApplicationController
  def index; end

  def show
    @inventory = Inventory.find(params[:id])
  end
end
