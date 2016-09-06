class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    Merchant.most_items(params[:quantity].to_i)
  end
end
