require 'rails_helper'

include RequestHelper
describe 'Transactions controller' do
  it 'sends a list of transactions' do
    transactions = create_list(:transaction, 10)

    get '/api/v1/transactions.json'

    expect(response).to be_success

    expect(json.first["id"]).to eq(transactions.first.id)
    expect(json.count).to eq(10)
  end
end
