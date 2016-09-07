FactoryGirl.define do
  factory :merchant do
    name { Faker::Name.name }
    created_at { Faker::Date.between(1.year.ago, 3.days.ago) }
    updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end

  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    created_at { Faker::Date.between(1.year.ago, 3.days.ago) }
    updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end
end
