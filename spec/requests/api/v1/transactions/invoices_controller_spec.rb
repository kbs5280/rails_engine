require 'rails_helper'

include RequestHelper
describe 'Transaction invoices controller' do
  it 'sends an invoice by id' do
    invoice = create(:invoice, id: 1)
    transaction_1 = create(:transaction, invoice_id: invoice.id)
    transaction_2 = create(:transaction)

    get "/api/v1/transactions/#{transaction_1.id}/invoice"

    expect(response).to be_success

    expect(json["id"]).to eq(1)
    expect(json.count).to eq(6)
  end
end
