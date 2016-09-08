class Api::V1::Invoices::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    transactions = Invoice.find(params[:id]).transactions
    respond_with transactions
  end
end
