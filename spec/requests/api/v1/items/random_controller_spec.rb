require 'rails_helper'

include RequestHelper
describe 'Items random controller' do

  it 'sends a random item' do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    get '/api/v1/items/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
