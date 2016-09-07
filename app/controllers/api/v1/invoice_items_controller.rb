class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    invoice_items = InvoiceItem.all
    respond_with invoice_items
  end

  def show
    invoice_item = InvoiceItem.find(params[:id])
    respond_with invoice_item
  end
end
