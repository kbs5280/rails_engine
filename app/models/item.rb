class Item < ApplicationRecord
  default_scope { order(id: :desc) }
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_random_item
    order("RANDOM()").limit(1)
  end

  def self.item_ranked_by_total_revenue_generated(quantity)
    # joins(:invoice_items).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit("#{quantity}")
  end
end
