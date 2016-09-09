class Api::V1::Items::MostItemsController < ApplicationController

  def index
    items = Item.item_ranked_by_total_number_sold(params[:quantity])
    respond_with items
  end
end
