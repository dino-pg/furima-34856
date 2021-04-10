class Buy < ApplicationRecord

  has_one :item
  belongs_to :user
  has_one :shipping_address
end
