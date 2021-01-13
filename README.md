	
# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |


### Association

- has_many :items
- has_many :purchases, dependent: :destroy
- has_one  :addresses


## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| image         |            |                                |
| name          | text       | null: false                    |
| content       | text       | null: false                    |
| category      | references | null: false, foreign_key: true |
| condition     | references | null: false, foreign_key: true |
| delivery_fee  | references | null: false, foreign_key: true |
| delivery_area | references | null: false, foreign_key: true |
| delivery_days | references | null: false, foreign_key: true |
| price         | integer    | null: false,                   |
| buyer_id      | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :purchases, dependent: :destroy



## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| telephone      | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |



### Association

- belongs_to :user


