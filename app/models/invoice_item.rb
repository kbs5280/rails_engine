class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.find_random_invoice_item
    order("RANDOM()").limit(1)
  end
end
