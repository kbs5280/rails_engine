require 'rails_helper'

include RequestHelper
describe 'Invoices controller' do
  it 'sends a list of invoices' do
    invoices = create_list(:invoice, 10)

    get '/api/v1/invoices.json'

    expect(response).to be_success

    expect(json.first["id"]).to eq(invoices.first.id)
    expect(json.count).to eq(10)
  end
end
