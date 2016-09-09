FactoryGirl.define do
  factory :merchant do
    name { Faker::Name.name }
  end

  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :item do
    name { Faker::Hipster.word}
    description { Faker::Hipster.sentence }
    merchant
    unit_price { Faker::Commerce.price }
  end

  factory :invoice do
    customer
    merchant
    status 'shipped'
  end

  factory :invoice_item do
    item
    invoice
    quantity { Faker::Number.between(1, 10) }
    unit_price { Faker::Commerce.price }
  end

  factory :transaction do
    invoice
    credit_card_number { Faker::Business.credit_card_number}
    result 'success'
  end
end
