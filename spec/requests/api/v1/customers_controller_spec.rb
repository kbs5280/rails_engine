require 'rails_helper'

include RequestHelper
describe 'Customers controller' do
  it 'sends a list of customers' do
    customers = create_list(:customer, 10)

    get '/api/v1/customers.json'

    expect(response).to be_success

    expect(json.first["first_name"]).to eq(customers.first.first_name)
    expect(json.count).to eq(10)
  end
end
