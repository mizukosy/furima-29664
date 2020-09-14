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

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| password_check   | string | null: false |
| email            | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :coments
- has_one  :purchases

## items テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| item_name            | string     | null: false                   |
| item_image           | string     | null: false                   |
| item_text            | text       | null: false                   |
| item_category        | string     | null: false                   |
| item_status          | string     | null: false                   |
| item_price           | integer    | null: false                   |
| item_price_fee       | integer    | null: false                   |
| item_delivery_chager | string     | null: false                   |
| item_delivery_area   | string     | null: false                   |
| user                 | references | null: false, forgen_key: true |
 

### Association

- belongs_to :user
- has_many :comments
- belongs_to :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column     | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user_id                  | integer    | null: false, forgen_key: true |
| item-id           | integer    | null: false, forgen_key: true |
<!-- referenseで作るかどうかを検討 -->
### Association

- belongs_to :item
- belongs_to :user