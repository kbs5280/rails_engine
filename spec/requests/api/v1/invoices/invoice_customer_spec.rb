require 'rails_helper'

include RequestHelper
describe 'Invoice customers controller' do
  it 'sends an customer by id' do
    customer = create(:customer, id: 12, first_name: 'Dan')
    customer2 = create(:customer, id: 22)
    invoice = create(:invoice, id: 1, customer_id: 12)
    invoice2 = create(:invoice, id: 2, customer_id: 22)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    expect(json["id"]).to eq(12)
    expect(json["first_name"]).to eq "Dan"
    expect(json.count).to eq(5)
  end
end
