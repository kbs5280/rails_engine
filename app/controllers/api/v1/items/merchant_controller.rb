class Api::V1::Items::MerchantController < ApplicationController

  def show
    merchant = Item.find(params[:id]).merchant
    respond_with merchant
  end
end
