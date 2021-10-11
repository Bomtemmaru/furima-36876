# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first_name    | string | null: false               |
| kana_lat_name      | string | null: false               |
| birth              | date   | null: false               |

- has_many :items
- has_many :histories

## items テーブル

| Column        | Type       | Options                         |
| ------        | ------     | -----------                     |
| title         | string     | null: false                     |
| description   | text       | null: false                     |
| category_id   | int        | null: false                     | Active hush
| condition_id  | int        | null: false                     | Active hush
| carriage_id   | int        | null: false                     | Active hush
| prefecture_id | int        | null: false                     | Active hush
| ship_day_id   | int        | null: false                     | Active hush
| price         | int        | null: false                     | 
| user          | references | null: false, foreign_key: true  |

- has_one :history
- belongs_to :user

## history テーブル

| Column    | Type       | Options                         |
| ----------| ------     | -----------                     |
| item      | references | null: false, foreign_key: true  |
| user      | references | null: false, foreign_key: true  |

- belongs_to :item
- has_one :address
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                         |
| ----------     | ------     | -----------                     |
| post_code      | string     | null: false                     |
| prefecture _id | int        | null: false                     |
| city           | string     | null: false                     |
| block          | string     | null: false                     |
| building       | string     |                                 |
| phone          | string     | null: false                     |
| history        | references | null: false, foreign_key: true  |

- belongs_to :history