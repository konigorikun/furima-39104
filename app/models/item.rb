class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :ship_from_organization

  validates :image, :name, :detail, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "Select"}
  validates :condition_id, numericality: { other_than: 1 , message: "Select"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "Select"}
  validates :ship_from_organization_id, numericality: { other_than: 1 , message: "Select"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "Select"}
  
  with_options presence: true do
    validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                     presence: { message: "Please enter with in the numeric range"}
  end
end
