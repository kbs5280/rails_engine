class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    find_random_customer = Customer.find_random_customer
    respond_with find_random_customer
  end
end
