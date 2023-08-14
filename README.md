# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nick_name          | string | null: false , unique: true |
| email              | string | null: false                |
| encrypted_password | string | null: false                |
| family_name_kanji  | string | null: false                |
| personal_name_kanji| string | null: false                |
| family_name_kana   | string | null: false                |
| personal_name_kana | string | null: false                |
| birthdate          | string | null: false                |

### Association
- has_many :items
- belongs_to :send
- belongs_to :buy


##　items テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| item_name          | string | null: false , unique: true |
| item_discription   | string | null: false                |
| item_condition     | string | null: false                |
| shipping_cost      | string | null: false                |
| shipping_origin    | string | null: false                |
| days_to_ship       | string | null: false                |
| price              | string | null: false                |
| user               | string | null: false                |

### Association

- belongs_to :user
- belongs_to :buy

## sends テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| postal_code        | string | null: false                |
| shipping_origin    | string | null: false                |
| city               | string | null: false                |
| street_address     | string | null: false                |
| building_address   | string | null: false                |
| phone_number       | string | null: false                |

### Association

- belongs_to :user

## buys テーブル

| Column             | Type       | Options                         |
| ------------------ | -----------| ------------------------------- |
| item               | references | null: false , foreign_key: true |
| user               | references | null: false , foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user