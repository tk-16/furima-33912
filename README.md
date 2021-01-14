	
# テーブル設計

## users テーブル

| Column    　　　　　　 | Type    | Options                  |
| -------- 　　　　　　  | ------  | -----------              |
| nickname 　　　　　　  | string  | null: false              |
| email      　　　　　　| string  | null: false, unique: true|
| encrypted_password   | string  | null: false              |
| first_name           | string  | null: false              |
| last_name            | string  | null: false              |
| first_name_kana      | string  | null: false              |
| last_name_kana       | string  | null: false              |
| birthday             | date    | null: false              |


### Association

- has_many :items
- has_many :purchases, dependent: :destroy



## items テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
| name             | text       | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false,                   |
| condition_id     | integer    | null: false,                   |
| delivery_fee_id  | integer    | null: false,                   |
| delivery_area_id | integer    | null: false,                   |
| delivery_days_id | integer    | null: false,                   |
| price            | integer    | null: false,                   |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one   :purchase, dependent: :destroy



## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one  :address

## addresses テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| post_cord        | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase


