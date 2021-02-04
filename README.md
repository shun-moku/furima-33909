# テーブル設計

## users テーブル

| Column     | Type    | Options                   |
| ---------- | ------  | ------------------------- |
| nickname   | string  | null: false               |
| email      | string  | null: false, unique: true |
| password   | string  | null: false               |
| kanji      | string  | null: false               |
| kana       | string  | null: false               |
| birthday   | integer | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                          |
| --------------- | ---------- | -------------------------------- |
| name            | text       | null: false                      |
| description     | text       | null: false                      |
| category        | string     | null: false                      |
| condition       | string     | null: false                      |
| shipping_charge | string     | null: false                      |
| region          | string     | null: false                      |
| delivery_dates  | string     | null: false                      |
| price           | integer    | null: false                      |
| user_id         | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user-id   | references | null: false, foreign_key: true |
| item-id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address




## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| order-id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order