class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json, :xml

  def show
    customer = Invoice.find(params[:id]).customer
    respond_with customer
  end
end
