class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    customer = Merchant.merchant_favorite_customer(params[:id])
    respond_with customer
  end
end
