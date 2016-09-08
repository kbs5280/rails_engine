require 'rails_helper'

include RequestHelper
describe 'Items controller' do
  it 'sends a list of items' do
    items = create_list(:item, 10)

    get '/api/v1/items.json'

    expect(response).to be_success

    expect(json.first["name"]).to eq(items.first.name)
    expect(json.count).to eq(10)
  end
end