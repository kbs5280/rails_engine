class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json, :xml

  def index
    items = Item.unscoped.select("items.*, SUM(invoice_items.quantity) AS total_items").joins(:invoices, :transactions).where(transactions: { result: 'success' }).order("total_items DESC").group('items.id')
    respond_with items
  end
end
