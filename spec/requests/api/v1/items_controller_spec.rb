require 'rails_helper'

include RequestHelper
describe 'Items controller' do
  it 'sends a list of items' do
    items = create_list(:item, 10)

    get '/api/v1/items'

    expect(response).to be_success

    expect(json.first["name"]).to eq(items.last.name)
    expect(json.count).to eq(10)
  end

  it 'return a single item with matching id' do
    item  = create(:item, id: 1 )
    item2 = create(:item, id: 2, name: 'Jimmy' )

    get "/api/v1/items/2"

    expect(response).to be_success

    expect(json["name"]).to eq "Jimmy"
    expect(json.count).to eq(7)
  end
end
