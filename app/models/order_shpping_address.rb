class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_number, :ship_from_organization_id, :municipality, :house_number, :building_name, :municipality, :user_id, :item_id

  with_options presence: true do
    validates :phone_number, :house_number, :municipality, :user_id, :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_from_organization_id, numericality: {other_than: 1, message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_number: post_number, ship_from_organization_id: ship_from_organization_id, municipality: municipality, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end