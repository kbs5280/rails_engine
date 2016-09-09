class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    random_invoice_item = InvoiceItem.find_random_invoice_item
    respond_with random_invoice_item
  end
end
