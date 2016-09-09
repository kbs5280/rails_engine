class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    most_revenue = Item.item_ranked_by_total_revenue_generated(params[:quantity])
    respond_with most_revenue
  end
end
