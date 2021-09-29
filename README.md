# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birth              | data   | null: false |

- has_many :items
- has_many :history

## items テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| title      | string     | null: false |
| description| text       | null: false |
| concept    | text       | null: false |
| user       | references | null: false |
| category   | int        | null: false | Active hush
| condition  | int        | null: false | Active hush
| carriage   | int        | null: false | Active hush
| area       | int        | null: false | Active hush
| ship_day   | int        | null: false | Active hush

- has_one :history

## history テーブル

| Column    | Type       | Options     |
| ----------| ------     | ----------- |
| content   | text       | null: false |
| item      | references | null: false |
| user      | references | null: false |

- belongs_to :items
- has_one :address

## address テーブル

| Column    | Type       | Options     |
| ----------| ------     | ----------- |
| post_code | int        | null: false |
| prefecture| int        | null: false |
| city      | string     | null: false |
| block     | int        | null: false |
| building  | string     |             |
| phone     | int        | null: false |
| history   | references | null: false |

- belongs_to :history