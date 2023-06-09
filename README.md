# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| surname               | string | null: false |
| name_kana               | string | null: false |
| surname_kana               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| year | integer | null: false |
| month | integer | null: false |
| date | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| name          | string  | null: false |
| info         | string | null: false |
| category_id         | integer | null: false |
| sales_status_id         | integer | null: false |
| shipping_fee_status_id         | integer | null: false |
| prefecture_id         | integer | null: false |
| price         | integer | null: false |
| scheduled_delivery_id         | integer | null: false |



### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


