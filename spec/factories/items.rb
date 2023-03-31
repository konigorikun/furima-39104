FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name                        {Faker::Name.name}
    detail                      {Faker::Name.name}
    category                    {Category.all.sample}
    condition                   {Condition.all.sample}
    delivery_charge             {DeliveryCharge.all.sample}
    ship_from_organization      {ShipFromOrganization.all.sample}
    days_to_ship                {DaysToShip.all.sample}
    cost                        {Faker::Number.between(from: 300, to: 9999_999)}
    association :user
  end
end
