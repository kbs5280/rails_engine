class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json, :xml

  def show
    merchant = Invoice.find(params[:id]).merchant
    respond_with merchant
  end
end
