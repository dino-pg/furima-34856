class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user
  # has_one :buy

  with_options presence: true do
    validates :item_name
    validates :item_description
    with_options numericality: { other_than: 1 } do
      validates :condition_id
      validates :category_id
      validates :charge_id
      validates :area_id
      validates :days_to_ship_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
