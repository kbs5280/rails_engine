# require 'csv'
#
# desc "Import business data from csv file"
# task :import => [:environment] do
#
# file = 'data/customers.csv'
# CSV.foreach(file, :headers => true) do |row|
#   Customer.create(
#     id:         row[0],
#     first_name: row[1],
#     last_name:  row[2],
#     created_at: row[3],
#     updated_at: row[4]
#   )
#   end
# end
#
# file = 'data/invoice_items.csv'
# CSV.for_each(file, :headers = true) do |row|
#   InvoiceItems.create {
#     :id         => row[1]
#     :item_id    => row[2]
#     :invoice_id => row[3]
#     :quantity   => row[4]
#     :unit_price => row[5]
#     :created_at => row[6]
#     :updated_at => row[7]
#   }
#   end
# end
#
# file = 'data/invoices.csv'
# CSV.for_each(file, :headers = true) do |row|
#   Invoices.create {
#     :id          => row[1]
#     :customer_id => row[2]
#     :merchant_id => row[3]
#     :status      => row[4]
#     :created_at  => row[5]
#     :updated_at  => row[6]
#   }
#   end
# end
#
# file = 'data/items.csv'
# CSV.for_each(file, :headers = true) do |row|
#   Items.create {
#     :id          => row[1]
#     :name        => row[2]
#     :description => row[3]
#     :unit_price  => row[4]
#     :merchant_id => row[5]
#     :created_at  => row[6]
#     :updated_at  => row[7]
#   }
#   end
# end
#
# file = 'data/merchants.csv'
# CSV.for_each(file, :headers = true) do |row|
#   Merchants.create {
#     :id         => row[1]
#     :name       => row[2]
#     :created_at => row[3]
#     :updated_at => row[4]
#   }
#   end
# end
#
# file = 'data/transactions.csv'
# CSV.for_each(file, :headers = true) do |row|
#   Transactions.create {
#     :id                          => row[1]
#     :invoice_id                  => row[2]
#     :credit_card_number          => row[3]
#     :credit_card_expiration_date => row[4]
#     :result                      => row[5]
#     :created_at                  => row[6]
#     :updated_at                  => row[7]
#   }
#   end
# end
