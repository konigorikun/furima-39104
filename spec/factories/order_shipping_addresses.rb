FactoryBot.define do
  factory :order_shipping_address do
    post_number                 { '123-4567' }
    ship_from_organization_id   { 2 }
    municipality                { '横浜市' }
    house_number                { '青山1-1-1' }
    building_name               { '東京ハイツ' }
    phone_number                { '09012345678' }
    token                       { 'tok_abcdefghijk00000000000000000' }
  end
end
