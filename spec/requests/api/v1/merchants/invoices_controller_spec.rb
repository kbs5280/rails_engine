require 'rails_helper'

include RequestHelper
describe 'Merchants invoices controller' do
  it 'sends a list of invoices by id' do
    merchant_1 = create(:merchant, id: '1')
    merchant_2 = create(:merchant, id: '2')
    merchant_3 = create(:merchant, id: '3')
    invoice_1  = create(:invoice, merchant_id: merchant_1.id)
    invoice_2  = create(:invoice, merchant_id: merchant_1.id)
    invoice_3  = create(:invoice)


    get "/api/v1/merchants/#{merchant_1.id}/invoices"

    expect(response).to be_success

    expect(json.first["merchant_id"]).to eq(1)
    expect(json.second["merchant_id"]).to eq(1)
    expect(json.count).to eq(2)
  end
end
