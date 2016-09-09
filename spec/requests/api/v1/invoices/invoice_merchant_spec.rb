require 'rails_helper'

include RequestHelper
describe 'Invoice merchant controller' do
  it 'sends an merchant by id' do
    merchant  = create(:merchant, id: 12, name: 'Dan')
    merchant2 = create(:merchant, id: 22)
    invoice   = create(:invoice, id: 1, merchant_id: 12)
    invoice2  = create(:invoice, id: 2, merchant_id: 22)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    expect(json["id"]).to eq(12)
    expect(json["name"]).to eq "Dan"
    expect(json.count).to eq(4)
  end
end
