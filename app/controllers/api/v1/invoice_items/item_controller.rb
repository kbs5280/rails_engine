class Api::V1::InvoiceItems::ItemController < ApplicationController
  respond_to :json, :xml

  def show
    item = InvoiceItem.find(params[:id]).item
    respond_with item
  end
end
