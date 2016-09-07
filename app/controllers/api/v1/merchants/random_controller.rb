class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random_merchant = Merchant.find_random_merchant
    respond_with random_merchant
  end
end
