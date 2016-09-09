class Api::V1::Customers::RandomController < ApplicationController

  def show
    find_random_customer = Customer.find_random_customer
    respond_with find_random_customer
  end
end
