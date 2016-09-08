class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json, :xml

  def show
    invoice = InvoiceItem.find(params[:id]).invoice
    respond_with invoice
  end
end
