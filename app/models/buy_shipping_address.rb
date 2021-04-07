class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name, :buy

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user
    validates :item
    end
    validate :building_name

    def save
      Buy.create(user: user, item: item)
      ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, phone_number: phone_number)
    end
end