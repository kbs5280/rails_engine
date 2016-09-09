class Api::V1::InvoiceItems::ItemController < ApplicationController

  def show
    item = InvoiceItem.find(params[:id]).item
    respond_with item
  end
end
