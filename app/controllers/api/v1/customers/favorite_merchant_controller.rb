class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    # binding.pry
    # merchant = Customer.joins(:invoices [:transactions, :invoice_items])
    # respond_with merchant
  end
  # returns a merchant where the customer has conducted the most successful transactions
end
