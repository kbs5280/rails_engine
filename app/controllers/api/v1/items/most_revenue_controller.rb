class Api::V1::Items::MostRevenueController < ApplicationController
  respond_to :json, :xml

  def index
    # most_revenue = Item.joins(:invoice_items).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit("#{quantity}")
    most_revenue = Item.joins(:invoice_items)
    # .item_ranked_by_total_revenue_generated(params[:quantity])
    respond_with most_revenue
  end
end
