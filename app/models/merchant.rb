class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: :invoice_items).group(:id).order('sum(invoice_items.quantity) DESC').limit(quantity)
  end

  def self.revenue_by_date_all_merchants(date)
    result = joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).where(invoices: { created_at: date}).sum('invoice_items.quantity * invoice_items.unit_price')
    (result.round / 100.0).to_s
  end

  def self.revenue_across_all_transactions(merchant_id)
    result = joins(invoices: [:transactions, :invoice_items]).where(id: merchant_id).where(transactions: {result: "success"}).sum("invoice_items.quantity *invoice_items.unit_price")
    (result.round / 100.0).to_s
  end

  def self.revenue_across_all_transactions_associated_with_one_merchant_by_date(merchant_id, date)
    result = joins(invoices: [:transactions, :invoice_items]).where(id: merchant_id).where(transactions: { result: 'success' }).where(invoices: { created_at: date}).sum('invoice_items.quantity * invoice_items.unit_price')
      (result.round / 100.0).to_s
  end
end


# Customer.joins(invoices: :transactions).group(:id).where(transactions: {result: 'success'}).count
