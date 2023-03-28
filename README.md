# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| email              | string   | null: false,  unique: true |
| encrypted_password | string   | null: false                |
| nickname           | string   | null: false                |
| firstname          | string   | null: false                |
| lastname           | string   | null: false                |
| firstname_kana     | string   | null: false                |
| lastname_kana      | string   | null: false                |
| date_of_birthday   | datetime | null: false                |

### Association

- has_many :items 
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| detail                 | text       | null: false                    |
| category               | string     | null: false                    |
| condition              | text       | null: false                    |
| delivery_charge        | integer    | null: false                    |
| ship_from_organization | string     | null: false                    |
| days_to_ship           | integer    | null: false                    |
| cost                   | integer    | null: false                    |
| sailer                 | string     | null: false                    |
| user_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| buyer       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :item
- has_one :shipping_addresses

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| address       | string     | null: false                    |
| post_number   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :order
