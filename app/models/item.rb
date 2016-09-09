class Item < ApplicationRecord
  default_scope { order(id: :desc) }
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.find_random_item
    order("RANDOM()").limit(1)
  end

  def self.item_ranked_by_total_revenue_generated(quantity)
    unscoped.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").joins(:invoices, :transactions).where(transactions: { result: 'success' }).order("total_revenue DESC").group('items.id').limit(quantity)
  end

  def self.item_ranked_by_total_number_sold(quantity)
    unscoped.select("items.*, SUM(invoice_items.quantity) AS total_items").joins(:invoices, :transactions).where(transactions: { result: 'success' }).order("total_items DESC").group('items.id').limit(quantity)
  end
end
