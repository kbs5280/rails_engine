class Api::V1::Invoices::RandomController < ApplicationController

  def show
    random_invoice = Invoice.find_random_invoice
    respond_with random_invoice
  end
end
