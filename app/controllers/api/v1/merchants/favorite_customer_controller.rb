class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json, :xml

  def show
    require "pry"; binding.pry
    # returns the customer who has conducted the most total number of successful transactions.
    # merchants joins to transactions
    # merchants joins to customers
    # customer where the most successful transactions
  end
end
