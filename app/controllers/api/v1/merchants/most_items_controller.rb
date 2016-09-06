class Api::V1::Merchants::MostItemsController < ApplicationController
  respond_to :json, :xml
  
  def index
    most_items = Merchant.most_items(params[:quantity].to_i)
    respond_with most_items
  end
end
