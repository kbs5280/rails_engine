class Item < ApplicationRecord
  default_scope { order(id: :desc) }
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.find_random_item
    order("RANDOM()").limit(1)
  end
end
