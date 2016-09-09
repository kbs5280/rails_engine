require 'rails_helper'

include RequestHelper
describe 'Merchants find controller' do
  it 'sends a list of merchants by params' do
    merchant_1 = create(:merchant, name: 'Tim', created_at: '2012-03-27T14:54:05.000Z')
    merchant_2 = create(:merchant, name: 'Tim', created_at: '2012-03-27T14:54:05.000Z')
    merchant_3 = create(:merchant, name: 'Grace', created_at: '2012-03-27T14:54:05.000Z')

    get '/api/v1/merchants/find_all', { name: 'Tim',
                                        created_at: '2012-03-27T14:54:05.000Z' }

    expect(response).to be_success

    expect(json.first["name"]).to eq('Tim')
    expect(json.second["name"]).to eq('Tim')
    expect(json.count).to eq(2)
  end

  it 'sends an invoice by params' do
    merchant_1 = create(:merchant, name: 'Tim', created_at: '2012-03-27T14:54:05.000Z')
    merchant_2 = create(:merchant, name: 'Tim', created_at: '2012-03-27T14:54:05.000Z')
    merchant_3 = create(:merchant, name: 'Grace', created_at: '2012-03-27T14:54:05.000Z')

    get '/api/v1/merchants/find', { name: 'Tim',
                                        created_at: '2012-03-27T14:54:05.000Z' }

    expect(response).to be_success

    expect(json["name"]).to eq('Tim')
    expect(json.count).to eq(4)
    expect(json.count).not_to eq(8)
  end
end
