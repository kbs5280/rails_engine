require 'rails_helper'

include RequestHelper
describe 'Invoice invoice_items controller' do
  it 'sends an invoice_item by id' do
    invoice       = create(:invoice, id: 1)
    invoice2      = create(:invoice, id: 2)
    invoice_item  = create(:invoice_item, id: 35, invoice_id: 2)
    invoice_item2 = create(:invoice_item, id: 72, invoice_id: 1)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    expect(json.first["id"]).to eq(72)
    expect(json.first["invoice_id"]).to eq(1)
    expect(json.first.count).to eq(7)
  end
end
