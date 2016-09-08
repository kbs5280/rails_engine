class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    Customer.find(params[:id]).merchants.select("merchants.*, count(transactions.id) as transaction_count").joins(:transactions).where(transactions: { result: 'success' }).group('merchants.id').order('transaction_count DESC').first
  end
end
