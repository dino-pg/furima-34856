FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    encrypted_password {Faker::Internet.password}
    family_name {Faker::Name.initials}
    first_name {Faker::Name.initials}
    kana_family_name {Faker::Name.initials}
    kana_first_name {Faker::Name.initials}
    birthday {Faker::Date.birthday}