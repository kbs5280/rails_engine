class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    most_revenue = Merchant.most_revenue(params[:quantity])
    respond_with most_revenue
  end
end
