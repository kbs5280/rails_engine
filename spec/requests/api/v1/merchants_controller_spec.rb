require 'rails_helper'

include RequestHelper
describe 'Merchants controller' do
  it 'sends a list of merchants' do
    merchants = create_list(:merchant, 10)

    get '/api/v1/merchants.json'

    expect(response).to be_success

    expect(json.count).to eq(10)
  end
end
