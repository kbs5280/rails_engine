require 'rails_helper'

include RequestHelper
describe 'Invoices controller' do
  it 'sends a list of invoices' do
    invoices = create_list(:invoice, 10)

    get '/api/v1/invoices'

    expect(response).to be_success

    expect(json.first["id"]).to eq(invoices.first.id)
    expect(json.count).to eq(10)
  end

  it 'return a single invoice with matching is' do
    invoice = create(:invoice, id: 1)
    invoice2 = create(:invoice, id: 2)

    get "/api/v1/invoices/2"

    expect(response).to be_success

    expect(json["id"]).to eq 2
    expect(json.count).to eq(6)
  end
end
