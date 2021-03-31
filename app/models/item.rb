class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user
  has_one :buy

  
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :condition_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :charge_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user
  end
end
