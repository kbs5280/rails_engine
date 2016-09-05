class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    Merchant.joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
  end
end
