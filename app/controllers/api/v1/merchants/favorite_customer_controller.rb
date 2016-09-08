class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json, :xml

  def show
    Merchant.first.customers.select("customers.*, count(transactions.id) as transaction_count").joins(:transactions).where(transactions: { result: 'success' }).group('customers.id').order('transaction_count DESC').first
  end
end
