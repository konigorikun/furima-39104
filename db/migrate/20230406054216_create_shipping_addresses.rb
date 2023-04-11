class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :post_number,                null: false
      t.integer    :ship_from_organization_id,  null: false
      t.string     :municipality,               null: false
      t.string     :house_number,               null: false
      t.string     :building_name
      t.string     :phone_number,               null: false
      t.references :order,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
