require 'rails_helper'

include RequestHelper
describe 'invoice_items find controller' do
  it 'sends a single invoice_item by params' do
    item          = create(:item, id: 1)
    item2         = create(:item, id: 2)
    invoice       = create(:invoice, id: 1)
    invoice2      = create(:invoice, id: 2)
    invoice_item  = create(:invoice_item, id: 1, item_id: 1, invoice_id: 1)
    invoice_item2 = create(:invoice_item, id: 2, item_id: 1, invoice_id: 1)
    invoice_item3 = create(:invoice_item, id: 3, item_id: 1, invoice_id: 1)
    invoice_item4 = create(:invoice_item, id: 4, item_id: 1, invoice_id: 2)
    invoice_item5 = create(:invoice_item, id: 5, item_id: 2, invoice_id: 2)

    get '/api/v1/invoice_items/find', params: { item_id: 1,
                                                invoice_id: 1}

    expect(response).to be_success
    expect(json["id"]).to eq(invoice_item.id)
    expect(json["id"]).not_to eq(invoice_item2.id)
    expect(json.count).to eq(7)
  end

  it 'it should send a list of invoice_items by params' do
    item          = create(:item, id: 1)
    item2         = create(:item, id: 2)
    invoice       = create(:invoice, id: 1)
    invoice2      = create(:invoice, id: 2)
    invoice_item  = create(:invoice_item, id: 1, item_id: 1, invoice_id: 1)
    invoice_item2 = create(:invoice_item, id: 2, item_id: 1, invoice_id: 1)
    invoice_item3 = create(:invoice_item, id: 3, item_id: 1, invoice_id: 1)
    invoice_item4 = create(:invoice_item, id: 4, item_id: 1, invoice_id: 2)
    invoice_item5 = create(:invoice_item, id: 5, item_id: 2, invoice_id: 2)

    get '/api/v1/invoice_items/find_all', params: { item_id: 1,
                                                    invoice_id: 1}
    expect(response).to be_success
    expect(json.first["id"]).to eq(invoice_item.id)
    expect(json.count).to eq(3)
  end
end
