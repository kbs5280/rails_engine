require 'rails_helper'

include RequestHelper
describe 'Invoice items controller' do
  it 'sends an item by id' do
    item = create(:item, id: 35)
    item2 = create(:item, id: 72, name: 'computer')
    invoice = create(:invoice, id: 1)
    invoice2 = create(:invoice, id: 2)
    invoice_item = create(:invoice_item, id: 35, invoice_id: 2, item_id: 35)
    invoice_item2 = create(:invoice_item, id: 72, invoice_id: 1, item_id: 72)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    expect(json.first["id"]).to eq(72)
    expect(json.first["name"]).to eq("computer")
    expect(json.first.count).to eq(7)
  end
end
