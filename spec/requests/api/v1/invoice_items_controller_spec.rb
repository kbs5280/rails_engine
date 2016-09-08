require 'rails_helper'

include RequestHelper
describe 'Invoice Items controller' do
  it 'sends a list of invoice items' do
    invoice_items = create_list(:invoice_item, 10)

    get '/api/v1/invoice_items.json'

    expect(response).to be_success

    expect(json.first["id"]).to eq(invoice_items.first.id)
    expect(json.count).to eq(10)
  end
end
