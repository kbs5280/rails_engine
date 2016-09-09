require 'rails_helper'

include RequestHelper
describe 'Merchants random controller' do

  it 'sends a random customer' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)

    get '/api/v1/merchants/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
