class Api::V1::Invoices::CustomerController < ApplicationController

  def show
    customer = Invoice.find(params[:id]).customer
    respond_with customer
  end
end
