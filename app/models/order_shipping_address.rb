class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_number, :ship_from_organization_id, :municipality, :house_number, :building_name, :phone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :ship_from_organization_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, :house_number, :user_id, :item_id, :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_number: post_number, ship_from_organization_id: ship_from_organization_id,
                           municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
