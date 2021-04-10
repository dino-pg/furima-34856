FactoryBot.define do
  factory :buy_shipping_address do
    postal_code { '123-4567' }
    prefectures_id { 2 }
    municipality { '札幌市北区' }
    address { '1-23' }
    phone_number { '09012345678' }
    user_id { Faker::Number }
    item_id { Faker::Number }
    token { 'abcdefg' }
    building_name { '山田ビル' }
  end
end
