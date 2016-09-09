require 'rails_helper'

include RequestHelper
describe 'Customers transactions controller' do
  it 'sends a list of transactions by id' do
    customer       = create(:customer, id: '1')
    invoice        = create(:invoice, customer_id: customer.id, id: 1)
    transaction_1  = create(:transaction, invoice_id: invoice.id)
    transaction_2  = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    expect(json.first["invoice_id"]).to eq(1)
    expect(json.second["invoice_id"]).to eq(1)
    expect(json.count).to eq(2)
  end
end
