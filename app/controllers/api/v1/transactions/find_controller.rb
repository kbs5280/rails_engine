class Api::V1::Transactions::FindController < ApplicationController
  respond_to :json, :xml

  def index
    require 
    transaction = Transaction.where(transaction_params)
    respond_with transaction
  end

  def show
    require 
    transaction = Transaction.find_by(transaction_params)
    respond_with transaction
  end

  private

    def transaction_params
      params.permit(:id, :credit_card_expiration_date, :invoice_id, :result, :created_at, :updated_at, :credit_card_number)
    end
end
