class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    invoices = Merchant.find(params[:id]).invoices
    respond_with invoices
  end
end
