require 'rails_helper'

include RequestHelper
describe 'Customers invoices controller' do
  it 'sends a list of invoices by id' do
    customer_1 = create(:customer, id: '1')
    customer_2 = create(:customer, id: '2')
    customer_3 = create(:customer, id: '3')
    invoice_1  = create(:invoice, customer_id: customer_1.id)
    invoice_2  = create(:invoice, customer_id: customer_1.id)
    invoice_3  = create(:invoice)


    get "/api/v1/customers/#{customer_1.id}/invoices"

    expect(response).to be_success

    expect(json.first["customer_id"]).to eq(1)
    expect(json.second["customer_id"]).to eq(1)
    expect(json.count).to eq(2)
  end
end
