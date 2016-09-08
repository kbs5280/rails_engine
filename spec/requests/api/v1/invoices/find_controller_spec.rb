require 'rails_helper'

include RequestHelper
describe 'Invoice find controller' do
  it 'sends a list of invoices by params' do
    merchant  = create(:merchant, id: 2)
    customer  = create(:customer, id: 3)
    invoice_1 = create(:invoice, id: '1', merchant_id: 2, customer_id: 3)
    invoice_2 = create(:invoice, id: '2', merchant_id: 2, customer_id: 3)
    invoice_3 = create(:invoice, id: '3', customer_id: 3)
    invoice_4 = create(:invoice)

    get '/api/v1/invoices/find_all', { merchant_id: '2',
                                       customer_id: '3' }

    expect(response).to be_success

    expect(json.first["id"]).to eq(1)
    expect(json.second["id"]).to eq(2)
    expect(json.count).to eq(2)
  end

  it 'sends an invoice by params' do
    invoice_1 = create(:invoice, id: '1')
    invoice_2 = create(:invoice, id: '2')
    invoice_3 = create(:invoice, id: '42')

    get '/api/v1/invoices/find_all', { id: 42 }

    expect(response).to be_success

    expect(json.first["id"]).to eq(42)
    expect(json.first["id"]).not_to eq('1')
    expect(json.count).to eq(1)
  end
end
