require 'rails_helper'

include RequestHelper
describe 'Merchants controller' do
  it 'sends a list of merchants' do
    merchants = create_list(:merchant, 10)

    get '/api/v1/merchants'

    expect(response).to be_success

    expect(json.first["name"]).to eq(merchants.first.name)
    expect(json.count).to eq(10)
  end

  it 'return a single merchant with matching is' do
    merchant  = create(:merchant, id: 1, name: "Slice")
    merchant2 = create(:merchant, id: 2, name: "Thrice")

    get '/api/v1/merchants/2'

    expect(response).to be_success

    expect(json["name"]).to eq "Thrice"
    expect(json.count).to eq(4)
  end
end
