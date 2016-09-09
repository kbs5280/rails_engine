class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    transactions = Invoice.find(params[:id]).transactions
    respond_with transactions
  end
end
