require 'rails_helper'

include RequestHelper
describe 'Transactions controller' do
  it 'sends a list of transactions' do
    transactions = create_list(:transaction, 10)

    get '/api/v1/transactions'

    expect(response).to be_success

    expect(json.first["id"]).to eq(transactions.first.id)
    expect(json.count).to eq(10)
  end

  it 'returns a single transaction with matching id' do
    transaction = create(:transaction, id: 10)
    transaction2 = create(:transaction, id: 12)

    get '/api/v1/transactions/12'

    expect(response).to be_success

    expect(json["id"]).to eq 12
    expect(json.count).to eq(6)
  end
end
