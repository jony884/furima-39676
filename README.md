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
- has_many :buy


##　items テーブル

| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| item_name          | string     | null: false                     |
| item_discription   | text       | null: false                     |
| item_condition_id  | integer    | null: false                     |
| shipping_cost_id   | integer    | null: false                     |
| shipping_origin _id| integer    | null: false                     |
| days_to_ship_id    | integer    | null: false                     |
| price              | string     | null: false                     |
| user               | references | null: false , foreign_key: true | 

### Association

- belongs_to :user
- has_one :buy

## sends テーブル

| Column             | Type    | Options                         |
| -------------------| --------| --------------------------------|
| postal_code_id     | integer | null: false                     |
| shipping_origin_id | integer | null: false                     |
| city               | string  | null: false                     |
| street_address     | string  | null: false                     |
| building_address   | string  |                                 |
| phone_number       | string  | null: false                     |
| item               | string  | null: false , foreign_key: true |

### Association

- has_many :buy

## buys テーブル

| Column             | Type       | Options                         |
| ------------------ | -----------| ------------------------------- |
| item               | references | null: false , foreign_key: true |
| user               | references | null: false , foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :send