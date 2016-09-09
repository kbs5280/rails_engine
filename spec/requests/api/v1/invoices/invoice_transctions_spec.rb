require 'rails_helper'

include RequestHelper
describe 'Invoice transactions controller' do
  it 'sends an transaction by id' do
    invoice      = create(:invoice, id: 1)
    invoice2     = create(:invoice, id: 2)
    transaction  = create(:transaction, id: 35, invoice_id: 2)
    transaction2 = create(:transaction, id: 72, invoice_id: 1)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    expect(json.first["id"]).to eq(72)
    expect(json.first["invoice_id"]).to eq(1)
    expect(json.first.count).to eq(6)
  end
end
