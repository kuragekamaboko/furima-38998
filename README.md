# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
