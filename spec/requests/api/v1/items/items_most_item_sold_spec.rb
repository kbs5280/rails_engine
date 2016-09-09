require 'rails_helper'

include RequestHelper
describe 'Items most items sold controller' do
  it 'returns the item that was sold most' do
    merchant      = create(:merchant, id: 1)
    merchant2     = create(:merchant, id: 2)
    item          = create(:item, id: 35, name: 'headphone', merchant_id: 1)
    item2         = create(:item, id: 72, name: 'computer', merchant_id: 2)
    invoice       = create(:invoice, id: 1)
    invoice2      = create(:invoice, id: 2)
    transaction   = create(:transaction, id: 1, invoice_id: 2)
    transaction2  = create(:transaction, id: 2, invoice_id: 1)
    invoice_item1 = create(:invoice_item, id: 1, invoice_id: 2, item_id: 35)
    invoice_item2 = create(:invoice_item, id: 2, invoice_id: 2, item_id: 35)
    invoice_item3 = create(:invoice_item, id: 3, invoice_id: 2, item_id: 35)
    invoice_item4 = create(:invoice_item, id: 72, invoice_id: 1, item_id: 72)

    get "/api/v1/items/most_items?quantity=2"

    expect(response).to be_success

    expect(json.first["id"]).to eq(35)
    expect(json.first["name"]).to eq("headphone")
    expect(json.first.count).to eq(7)
  end
end
