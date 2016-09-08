class Api::V1::Items::MerchantController < ApplicationController
  respond_to :json, :xml

  def show
    merchant = Item.find(params[:id]).merchant
    respond_with merchant
  end
end
