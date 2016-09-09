class Api::V1::ItemsController < ApplicationController

  def index
    items = Item.all
    respond_with items
  end

  def show
    item = Item.find(params[:id])
    respond_with item
  end
end
