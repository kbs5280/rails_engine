require 'rails_helper'

include RequestHelper
describe 'Merchants revenue controller' do
  it 'sends a list of invoices by id' do
    merchant_1     = create(:merchant, name: 'Alan')
    merchant_2     = create(:merchant, name: 'Tim')
    merchant_3     = create(:merchant, name: 'Grace')
    item_1         = create(:item, merchant_id: merchant_1.id, unit_price: "1")
    item_2         = create(:item, merchant_id: merchant_2.id, unit_price: "1")
    item_3         = create(:item, merchant_id: merchant_3.id, unit_price: "1")
    invoice_1      = create(:invoice, merchant_id: merchant_1.id, created_at: '2012-03-27T14:54:05.000Z')
    invoice_2      = create(:invoice, merchant_id: merchant_2.id, created_at: '2012-03-27T14:54:05.000Z')
    invoice_3      = create(:invoice, merchant_id: merchant_3.id, created_at: '2012-03-27T14:54:05.000Z')
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, unit_price: "1", quantity: "1")
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, unit_price: "1", quantity: "1")
    invoice_item_3 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_3.id, unit_price: "1", quantity: "1")
    transaction_1  = create(:transaction, invoice_id: invoice_1.id)
    transaction_2  = create(:transaction, invoice_id: invoice_2.id)
    transaction_3  = create(:transaction, invoice_id: invoice_3.id)

    get "/api/v1/merchants/revenue", { date: invoice_1.created_at }

    expect(response).to be_success

    expect(json["total_revenue"]).to eq("0.03")
  end
end
