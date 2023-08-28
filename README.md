# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nick_name          | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| family_name_kanji  | string | null: false                |
| personal_name_kanji| string | null: false                |
| family_name_kana   | string | null: false                |
| personal_name_kana | string | null: false                |
| birthdate          | date   | null: false                |

### Association
- has_many :items
- has_many :order


##　items テーブル

| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| item_name          | string     | null: false                     |
| item_description   | text       | null: false                     |
| item_condition_id  | integer    | null: false                     |
| shipping_cost_id   | integer    | null: false                     |
| shipping_origin_id | integer    | null: false                     |
| days_to_ship_id    | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false , foreign_key: true | 
| category_id        | integer    | null: false                     |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column             | Type    | Options                         |
| -------------------| --------| --------------------------------|
| postal_code_id     | string  | null: false                     |
| shipping_origin_id | integer | null: false                     |
| city               | string  | null: false                     |
| street_address     | string  | null: false                     |
| building_address   | string  |                                 |
| phone_number       | string  | null: false                     |
| buy                | string  | null: false , foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column             | Type       | Options                         |
| ------------------ | -----------| ------------------------------- |
| item               | references | null: false , foreign_key: true |
| user               | references | null: false , foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address