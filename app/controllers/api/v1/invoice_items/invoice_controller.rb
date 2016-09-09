class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def show
    invoice = InvoiceItem.find(params[:id]).invoice
    respond_with invoice
  end
end
