# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one  :profile


## profiles テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| detail   | text   | null: false |


### Association

- belongs_to :user


## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| text     | text       | null: false                    |
| title    | string     | null: false                    |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- has_one    :order


## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


## ordersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item