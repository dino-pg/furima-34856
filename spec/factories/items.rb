FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials }
    item_description { Faker::Name.initials }
    condition_id { 2 }
    category_id { 2 }
    charge_id { 2 }
    area_id { 2 }
    days_to_ship_id { 2 }
    price { 300 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
