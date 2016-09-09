class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    items = Merchant.find(params[:id]).items
    respond_with items
  end
end
