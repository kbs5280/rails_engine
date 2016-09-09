require 'rails_helper'

include RequestHelper
describe 'Invoice item random controller' do

  it 'sends a random invoice item' do
    invoice_item_1 = create(:invoice_item)
    invoice_item_2 = create(:invoice_item)
    invoice_item_3 = create(:invoice_item)

    get '/api/v1/invoice_items/random'

    expect(response).to be_success

    expect(json.count).to eq(1)
  end
end
