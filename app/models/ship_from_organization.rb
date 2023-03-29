class Ship_from_organization < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items
end