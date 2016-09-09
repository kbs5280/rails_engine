require 'rails_helper'

include RequestHelper
describe 'Items merchant controller' do
  it 'sends a merchant by id' do
    merchant = create(:merchant, name: 'Alan')
    item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    expect(json["name"]).to eq('Alan')
    expect(json.count).to eq(4)
  end
end
