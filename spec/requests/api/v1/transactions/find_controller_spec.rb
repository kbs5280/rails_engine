require 'rails_helper'

include RequestHelper
describe 'Transactions find controller' do
  it 'sends a list of transactions by params' do
    invoice = create(:invoice, id: 1)
    transaction_1 = create(:transaction, id: 1, invoice_id: invoice.id, credit_card_number: '1234567812345678')
    transaction_2 = create(:transaction, id: 2, invoice_id: invoice.id, credit_card_number: '1234567812345678')
    transaction_3 = create(:transaction, invoice_id: invoice.id, credit_card_number: '9234567812345678')

    get '/api/v1/transactions/find_all', { invoice_id: invoice.id,
                                           credit_card_number: '1234567812345678' }

    expect(response).to be_success

    expect(json.first["id"]).to eq(1)
    expect(json.second["id"]).to eq(2)
    expect(json.count).to eq(2)
  end

  it 'sends an item by params' do
    invoice = create(:invoice, id: 1)
    transaction_1 = create(:transaction, id: 1, invoice_id: invoice.id, credit_card_number: '1234567812345678')
    transaction_2 = create(:transaction, id: 2, invoice_id: invoice.id, credit_card_number: '1234567812345678')
    transaction_3 = create(:transaction, invoice_id: invoice.id, credit_card_number: '9234567812345678')

    get '/api/v1/transactions/find', { id: 1,
                                       credit_card_number: '1234567812345678' }

    expect(response).to be_success

    expect(json["id"]).to eq(1)
    expect(json["id"]).not_to eq(2)
    expect(json.count).to eq(6)
  end
end
