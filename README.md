# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_lat_name      | string | null: false |
| birth              | date   | null: false |

- has_many :items
- has_many :histories

## items テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| title      | string     | null: false |
| description| text       | null: false |
| concept    | text       | null: false |
| category   | int        | null: false | Active hush
| condition  | int        | null: false | Active hush
| carriage   | int        | null: false | Active hush
| area       | int        | null: false | Active hush
| ship_day   | int        | null: false | Active hush
| user       | references | null: false, foreign_key: true  |

- has_one :history
- belongs_to :user

## history テーブル

| Column    | Type       | Options     |
| ----------| ------     | ----------- |
| item      | references | null: false |
| user      | references | null: false |

- belongs_to :item
- has_one :address
- belongs_to :user

## address テーブル

| Column    | Type       | Options     |
| ----------| ------     | ----------- |
| post_code | string     | null: false |
| prefecture| int        | null: false |
| city      | string     | null: false |
| block     | int        | null: false |
| building  | string     |             |
| phone     | string     | null: false |
| history   | references | null: false |

- belongs_to :history