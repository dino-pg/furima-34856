class Buy < ApplicationRecord
  attr_accessor :token
  
  
  belongs_to :user
  has_one :shipping_address

  

  
end
