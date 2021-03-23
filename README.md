## テーブル名

# usersテーブル
|Column                 |Type    |Options       |
|-----------------------|--------|------------- |
| nickname              | string | null: false  |
| email                 | string | unique: true |
| encrypted_password    | string | hull: false  |
| family_name           | string | nill: false  |
| first_name            | string | nill: false  |
| kana_family_name      | string | nill: false  |
| kana_first_name       | string | nill: false  |
| birthday              | date   | nill: false  |

### Association
has_many :items
has_many :buy
belongs_to :shipping_address


# itemsテーブル
|Column                 |Type     |Options      |
|-----------------------|---------|-------------|
| item_name             | string  | null: false |
| item_description      | text    | null: false |
| condition_id          | string  | null: false |
| category_id           | string  | null: false |
| charge_id             | string  | null: false |
| area_id               | string  | null: false |
| days_to_ship          | string  | null: false |
| price                 | integer | null: false |

### Association
belongs_to :users
has_many :buy

# buyテーブル
|Column                 |Type     |Options      |
|-----------------------|---------|-------------|
| buy_goods_name        | string  | null: false |
| buy_user              | string  | null: false |

### Association
belongs_to :users
belongs_to :items

# shipping_addressテーブル
|Column                 |Type      |Options      |
|-----------------------|----------|-------------|
| postal_code           | string   | null: false |
| prefectures_id        | string   | null: false |
| municipality          | string   | null: false |
| address               | string   | null: false |
| phone_number          | string   | null: false |
| building_name         | string   | null: false |

### Association
belongs_to :users
belongs_to :buy
