class ShippingAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name, :buy

  belongs_to :buy

  with_options presence: true do
  validates :postal_code
  validates :prefectures_id
  validates :municipality
  validates :address
  validates :phone_number
  end
  validates :building_name

end
