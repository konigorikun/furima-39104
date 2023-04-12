class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :ship_from_organization

  validates :image, :name, :detail, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を入力して下さい' }
  validates :condition_id, numericality: { other_than: 1, message: 'を入力して下さい' }
  validates :delivery_charge_id, numericality: { other_than: 1, message: 'を入力して下さい' }
  validates :ship_from_organization_id, numericality: { other_than: 1, message: 'を入力して下さい' }
  validates :days_to_ship_id, numericality: { other_than: 1, message: 'を入力して下さい' }

  with_options presence: true do
    validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                     presence: { message: 'を入力して下さい' }
  end
end
