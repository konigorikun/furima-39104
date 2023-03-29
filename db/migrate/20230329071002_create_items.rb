class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                        null: false
      t.integer :detail,                      null: false
      t.integer :category_id,                 null: false
      t.integer :condition_id,                null: false
      t.integer :delivery_charge_id,          null: false
      t.integer :ship_from_organization_id,   null: false
      t.integer :days_to_ship_id,             null: false
      t.integer :cost,                        null: false
      t.timestamps
    end
  end
end
