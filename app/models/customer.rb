class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.find_random_customer
    order("RANDOM()").limit(1)
  end
end
