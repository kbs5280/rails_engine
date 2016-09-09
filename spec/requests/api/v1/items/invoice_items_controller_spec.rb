require 'rails_helper'

include RequestHelper
describe 'Items invoice items controller' do
  it 'sends a list of invoice items by id' do
    item = create(:item, id: 1)
    invoice_item_1 = create(:invoice_item, item_id: item.id)
    invoice_item_2 = create(:invoice_item, item_id: item.id)
    invoice_item_3 = create(:invoice_item, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    expect(json.first["item_id"]).to eq(1)
    expect(json.second["item_id"]).to eq(1)
  end
end
