class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    # connect merchants to invoices
    # connect invoices to transactions to ensure result = success
    # connect invoices to invoice items - where the cost is
    # check the invoices date by created_at
    # then sum the charges
    Merchant.revenue_by_date_all_merchants(params[:date])
  end
end
