class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json, :xml

  def index
    most_revenue = Merchant.most_revenue(params[:quantity])
    respond_with most_revenue
  end
end
