class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    require 
    customers = Customer.all
    respond_with customers
  end

  def show
    require 
    customer = Customer.find(params[:id])
    respond_with customer
  end
end
