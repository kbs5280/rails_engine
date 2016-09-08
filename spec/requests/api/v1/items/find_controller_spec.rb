require 'rails_helper'

include RequestHelper
describe 'Items find controller' do
  it 'sends a list of items by params' do
    merchant = create(:merchant, id: 1)
    item_1   = create(:item, name: 'machine')
    item_2   = create(:item, name: 'machine', merchant_id: 1)
    item_3   = create(:item, name: 'machine', merchant_id: 1)

    get '/api/v1/items/find_all', { name: 'machine',
                                    merchant_id: '1' }

    expect(response).to be_success

    expect(json.first["merchant_id"]).to eq(1)
    expect(json.second["merchant_id"]).to eq(1)
    expect(json.count).to eq(2)
  end

  it 'sends an item by params' do
    merchant_1 = create(:merchant, id: 1)
    merchant_2 = create(:merchant, id: 42)
    item_1 = create(:item, name: 'machine', merchant_id: 1)
    item_2 = create(:item, name: 'machine', merchant_id: 42)

    get '/api/v1/items/find', { name: 'machine', merchant_id: 42 }

    expect(response).to be_success

    expect(json["merchant_id"]).to eq(42)
    expect(json["merchant_id"]).not_to eq(1)
    expect(json.count).to eq(7)
  end
end
