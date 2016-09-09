class Api::V1::Merchants::RandomController < ApplicationController

  def show
    random_merchant = Merchant.find_random_merchant
    respond_with random_merchant
  end
end
