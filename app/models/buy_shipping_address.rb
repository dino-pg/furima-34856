class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id,
                                              municipality: municipality, address: address, phone_number: phone_number, buy_id: buy.id)
  end
end
