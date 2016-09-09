class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.find_random_customer
    order("RANDOM()").limit(1)
  end

  def self.customer_favorite_merchant(customer_id)
    find_by(id: customer_id).merchants.select("merchants.*, count(transactions.id) as transaction_count")
    .joins(:transactions)
    .where(transactions: { result: 'success' })
    .group('merchants.id')
    .order('transaction_count DESC').first
  end
end
