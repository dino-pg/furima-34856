## テーブル名

# usersテーブル
|Column                 |Type    |Options                    |
|-----------------------|--------|-------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| family_name           | string | nill: false               |
| first_name            | string | nill: false               |
| kana_family_name      | string | nill: false               |
| kana_first_name       | string | nill: false               |
| birthday              | date   | nill: false               |

### Association
has_many :items
has_many :buys


# itemsテーブル
|Column                 |Type        |Options                         |
|-----------------------|----------- |------------------------------- |
| item_name             | string     | null: false                    |
| item_description      | text       | null: false                    |
| condition_id          | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| charge_id             | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| days_to_ship_id       | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | foreign_key :true              |

### Association
belongs_to :user
has_one :buy

# buysテーブル
|Column                 |Type        |Options            |
|-----------------------|------------|-------------------|
| user                  | references | foreign_key :true |
| item                  | references | foreign_key :true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

# shipping_addressテーブル
|Column                 |Type        |Options              |
|-----------------------|----------- |---------------------|
| postal_code           | string     | null: false         |
| prefectures_id        | integer    | null: false         |
| municipality          | string     | null: false         |
| address               | string     | null: false         |
| phone_number          | string     | null: false         |
| building_name         | string     |                     |
| buy                   | references | foreign_key :true   |

### Association
belongs_to :buy