class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random_transactions = Transaction.find_random_transactions
    respond_with random_transactions
  end
end
