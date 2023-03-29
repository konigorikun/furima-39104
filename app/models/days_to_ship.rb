class Days_to_ship < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items
end