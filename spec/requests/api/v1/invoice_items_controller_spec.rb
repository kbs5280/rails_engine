require 'rails_helper'

include RequestHelper
describe 'Invoice Items controller' do
  it 'sends a list of invoice items' do
    invoice_items = create_list(:invoice_item, 10)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    expect(json.first["id"]).to eq(invoice_items.first.id)
    expect(json.count).to eq(10)
  end

  it 'returns a single invoice item with id' do
    invoice_item = create(:invoice_item, id: 1)
    invoice_item2 = create(:invoice_item, id: 2)

    get "/api/v1/invoice_items/1"

    expect(response).to be_success

    expect(json["id"]).to eq 1
    expect(json.count).to eq(7)
  end
end
