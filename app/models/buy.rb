class Buy
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name, :buy

  belongs_to :user
  has_one :shipping_address

  def save
  end
end
