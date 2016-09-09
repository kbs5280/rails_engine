require 'rails_helper'

include RequestHelper
describe 'Invoices random controller' do

  it 'sends a random invoice' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    invoice_3 = create(:invoice)

    get '/api/v1/invoices/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
