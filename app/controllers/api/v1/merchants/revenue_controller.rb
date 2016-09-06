class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def index
    revenue = Merchant.revenue_by_date_all_merchants( params[:date] )
    respond_with revenue
  end

  def show
    revenue = Merchant.revenue_across_all_transactions(params[:id])
    respond_with revenue
  end
end
