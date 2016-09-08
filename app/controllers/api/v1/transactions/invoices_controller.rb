class Api::V1::Transactions::InvoicesController < ApplicationController
respond_to :json, :xml

  def show
    invoice = Transaction.find(params[:id]).invoice
    respond_with invoice
  end
end
