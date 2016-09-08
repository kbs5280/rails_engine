class Api::V1::Items::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    invoice_items = Item.find(params[:id]).invoice_items
    respond_with invoice_items
  end
end
