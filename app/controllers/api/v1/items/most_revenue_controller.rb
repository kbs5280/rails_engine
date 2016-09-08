class Api::V1::Items::MostRevenueController < ApplicationController
  respond_to :json, :xml

  def index
    most_revenue = Item.unscoped.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").joins(:invoices, :transactions).where(transactions: { result: 'success' }).order("total_revenue DESC").group('items.id')
    respond_with most_revenue
  end
end
