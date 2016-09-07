class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random_invoice_item = InvoiceItem.find_random_invoice_item
    respond_with random_invoice_item
  end
end
