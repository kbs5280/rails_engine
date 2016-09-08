class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json, :xml

  def show
    merchant = Customer.customer_favorite_merchant(params[:id])
    respond_with merchant
  end
end
