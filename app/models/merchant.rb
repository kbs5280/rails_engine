class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    self.joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(quantity)
  end

  def self.most_items(quantity)
    self.joins(invoices: :invoice_items).group(:id).order('sum(invoice_items.quantity) DESC').limit(quantity)
  end

  def self.revenue_by_date_all_merchants(date)
    number_to_currency(self.joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: 'success' }).where(invoices: { created_at: params[:date]}).sum('invoice_items.quantity * invoice_items.unit_price'))
  end
end
