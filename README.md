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
- has_many :purchase

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| name          | string  | null: false |
| price         | integer | null: false |


### Association

- has_many :users
- has_many :purchase
- belongs_to :category

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| quantity  | integer | null: false |
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## category テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null false                               |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
