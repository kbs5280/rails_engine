class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    most_items = Merchant.most_items(params[:quantity].to_i)
    respond_with most_items
  end
end
