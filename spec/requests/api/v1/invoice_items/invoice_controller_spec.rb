require 'rails_helper'

include RequestHelper
describe 'Invoice items invoice controller' do
  it 'sends an invoice by id' do
    invoice = create(:invoice, id: 1)
    invoice_item = create(:invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    expect(json["id"]).to eq(1)
    expect(json.count).to eq(6)
  end
end
