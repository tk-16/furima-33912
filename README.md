	
# テーブル設計

## users テーブル

| Column    　　　　　　 | Type   | Options     |
| -------- 　　　　　　  | ------ | ----------- |
| nickname 　　　　　　  | string | null: false |
| email      　　　　　　| string | null: false |
| encrypted_password   | string | null: false |


### Association

- has_many :items
- has_many :purchases, dependent: :destroy



## items テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
| image            |            |                                |
| name             | text       | null: false                    |
| content          | text       | null: false                    |
| category         | references | null: false, foreign_key: true |
| condition        | references | null: false, foreign_key: true |
| delivery_fee_id  | references | null: false, foreign_key: true |
| delivery_area_id | references | null: false, foreign_key: true |
| delivery_days_id | references | null: false, foreign_key: true |
| price            | integer    | null: false,                   |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one   :purchases, dependent: :destroy



## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one  :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| post_cord      | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| telephone      | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |



### Association

- belongs_to :purchases


