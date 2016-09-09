require 'rails_helper'

include RequestHelper
describe 'Customers controller' do
  it 'sends a list of customers' do
    customers = create_list(:customer, 10)

    get '/api/v1/customers'

    expect(response).to be_success

    expect(json.first["first_name"]).to eq(customers.first.first_name)
    expect(json.count).to eq(10)
  end

  it 'returns a customer with the provided id' do
    customer = create(:customer, id: 1, first_name: 'Stan')
    customer2 = create(:customer, id: 2, first_name: 'Dan')

    get "/api/v1/customers/1"

    expect(json["first_name"]).to eq 'Stan'
    expect(json.count).to eq(5)
  end
end
