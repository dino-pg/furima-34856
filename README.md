## テーブル名

# usersテーブル
|Column                 |Type    |Options      |
|-----------------------|--------|-------------|
| nickname              | string | null: fales |
| email                 | string | null: fales |
| password              | string | hull: fales |
| confirmation_password | string | null: fales |
| family_name           | string | nill: fales |
| first_name            | string | nill: fales |
| kana_family_name      | string | nill: fales |
| kana_first_name       | string | nill: fales |
| birthday              | date   | nill: fales |

### Association
has_many :items
belongs_to :buy
belongs_to :shipping_address


# itemsテーブル
|Column                 |Type     |Options      |
|-----------------------|---------|-------------|
| image                 | string  | null: fales |
| item_name             | string  | null: fales |
| item_description      | text    | null: fales |
| item_condition        | string  | null: fales |
| category_name         | string  | null: fales |
| shipping_charges      | string  | null: fales |
| shipping_area         | string  | null: fales |
| days_to_ship          | string  | null: fales |
| price                 | integer | null: fales |

### Association
belongs_to :users
belongs_to :buy

# buyテーブル
|Column                 |Type     |Options      |
|-----------------------|---------|-------------|
| buy_family_name       | string  | null: fales |
| buy_first_name        | string  | null: fales |

### Association
belongs_to :users
has_many :items

# shipping_addressテーブル
|Column                 |Type      |Options      |
|-----------------------|----------|-------------|
| shipping_address      | string   | null: fales |
| postal_code           | string   | null: fales |
| prefectures           | string   | null: fales |
| municipality          | string   | null: fales |
| address               | string   | null: fales |
| phone_number          | integer  | null: fales |

### Association
belongs_to :users
belongs_to :buy
