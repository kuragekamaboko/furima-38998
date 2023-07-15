# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| name               | string | null: false |
| surname            | string | null: false |
| name_kana          | string | null: false |
| surname_kana       | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |



### Association

- has_many :items
- has_one :order

## items テーブル

| Column                   | Type    | Options     |
| -------------            | ------  | ----------- |
| name                     | string  | null: false|
| info                     | text | null: false |
| category_id              | integer | null: false |
| sales_status_id          | integer | null: false |
| shipping_fee_status_id   | integer | null: false |
| prefecture_id            | integer | null: false |
| price                    | integer | null: false |
| scheduled_delivery_id    | integer | null: false |
| user                     | references |null:false, foreign_key: true |




### Association

- belongs_to :user
- has_one :order
- has_one :shipping_address

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user



## shipping_addresses テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code   | string | null: false  |
| city   | string | null: false  |
| addresses   | string | null: false  |
| building   | string |   |
| phone_number   | string | null: false  |
| order   | references | null: false, foreign_key: true |
| prefecture_id         | integer | null: false |


### Association

- belongs_to :order
