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
| date_of_birthday   | date     | null: false                |

### Association

- has_many :items 
- has_many :orders

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| detail                    | text       | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| delivery_charge_id        | integer    | null: false                    |
| ship_from_organization_id | integer    | null: false                    |
| days_to_ship_id           | integer    | null: false                    |
| cost                      | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column                    | Type         | Options                        |
| ------------------------- | ------------ | ------------------------------ |
| address                   | string       | null: false                    |
| post_number               | string       | null: false                    |
| ship_from_organization_id | integer      | null: false                    |
| municipality              | string       | null: false                    |
| house_number              | string       | null: false                    |
| building_name             | string       |                                |
| phone_number              | string       | null: false                    |
| order                     | references   | null: false, foreign_key: true |

### Association
- belongs_to :order
