class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name, :buy, :token

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
    end
    validate :building_name

    def save
      buy =  Buy.create(user_id: user_id, item_id: item_id)
      shipping_address = ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, phone_number: phone_number, buy_id: buy.id)
    end
end