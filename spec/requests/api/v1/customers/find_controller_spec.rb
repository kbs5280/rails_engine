require 'rails_helper'

include RequestHelper
describe 'Customers find controller' do
  it 'sends a list of customers by params' do
    customer_1 = create(:customer, first_name: 'Alan')
    customer_2 = create(:customer, first_name: 'Alan')
    customer_3 = create(:customer, first_name: 'Grace')

    get '/api/v1/customers/find_all', { first_name: 'Alan' }

    expect(response).to be_success

    expect(json.second["first_name"]).to eq('Alan')
    expect(json.count).to eq(2)
  end

  it 'sends a customer by params' do
    customer_1 = create(:customer, first_name: 'Alan')
    customer_2 = create(:customer, first_name: 'Alan')
    customer_3 = create(:customer, first_name: 'Grace')

    get '/api/v1/customers/find_all', { first_name: 'Grace' }

    expect(response).to be_success

    expect(json.first["first_name"]).to eq('Grace')
    expect(json.first["first_name"]).not_to eq('Alan')
    expect(json.count).to eq(1)
  end
end
