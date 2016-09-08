class Api::V1::Invoices::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    transactions = Invoice.find(params[:id]).transactions
    # transactions = Invoice.joins(:transactions).find(params[:id])
    # transactions = Invoice.joins(:transactions).where(invoice_id: params[:id])
    respond_with transactions
  end
end
