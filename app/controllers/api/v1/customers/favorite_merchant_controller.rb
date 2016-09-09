class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    merchant = Customer.customer_favorite_merchant(params[:id])
    respond_with merchant
  end
end
