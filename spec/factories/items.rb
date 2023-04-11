FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name                        { Faker::Name.name }
    detail                      { Faker::Name.name }
    category_id                 { 2 }
    condition_id                { 2 }
    delivery_charge_id          { 2 }
    ship_from_organization_id   { 2 }
    days_to_ship_id             { 2 }
    cost                        { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
