require 'rails_helper'

include RequestHelper
describe 'Transactions random controller' do
  it 'sends an transaction by params' do
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction)
    transaction_3 = create(:transaction)

    get '/api/v1/transactions/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
