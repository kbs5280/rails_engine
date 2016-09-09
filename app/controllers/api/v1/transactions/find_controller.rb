class Api::V1::Transactions::FindController < ApplicationController

  def index
    transaction = Transaction.where(transaction_params)
    respond_with transaction
  end

  def show
    transaction = Transaction.find_by(transaction_params)
    respond_with transaction
  end

  private

    def transaction_params
      params.permit(:id, :invoice_id, :result, :created_at, :updated_at, :credit_card_number)
    end
end
