class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions]).where(transactions: { result: 'success' }).group(:id).order('sum(invoice_items.quantity) DESC').limit(quantity)
  end

  def self.revenue_by_date_all_merchants(date)
    result = joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).where(invoices: { created_at: date}).sum('invoice_items.quantity * invoice_items.unit_price')
    {"total_revenue"=>("#{result.round / 100.0}").to_s}
  end

  def self.revenue_across_all_transactions(merchant_id)
    result = joins(invoices: [:transactions, :invoice_items]).where(id: merchant_id).where(transactions: {result: "success"}).sum("invoice_items.quantity *invoice_items.unit_price")
    format_response(result)
  end

  def self.revenue_across_all_transactions_associated_with_one_merchant_by_date(merchant_id, date)
    result = joins(invoices: [:transactions, :invoice_items]).where(id: merchant_id).where(transactions: { result: 'success' }).where(invoices: { created_at: date}).sum('invoice_items.quantity * invoice_items.unit_price')
    format_response(result)
  end

  def self.merchant_favorite_customer(merchant_id)
    find_by(id: merchant_id).customers.select("customers.*, count(transactions.id) as transaction_count").joins(:transactions).where(transactions: { result: 'success' }).group('customers.id').order('transaction_count DESC').first
  end

  def self.find_random_merchant
    order("RANDOM()").limit(1)
  end

  private

  def self.format_response(response)
    {"revenue"=>(response.round / 100.0).to_s}
  end
end
