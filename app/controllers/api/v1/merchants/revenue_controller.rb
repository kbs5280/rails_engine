 class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    revenue = Merchant.revenue_by_date_all_merchants( params[:date] )
    respond_with revenue
  end

  def show
    if params[:date]
      revenue = Merchant.revenue_across_all_transactions_associated_with_one_merchant_by_date(params[:id], params[:date])
      respond_with revenue
    else
      revenue = Merchant.revenue_across_all_transactions( params[:id] )
      respond_with revenue
    end
  end
end
