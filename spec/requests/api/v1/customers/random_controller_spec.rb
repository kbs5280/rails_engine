require 'rails_helper'

include RequestHelper
describe 'Customers random controller' do

  it 'sends a random customer' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    customer_3 = create(:customer)

    get '/api/v1/customers/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
