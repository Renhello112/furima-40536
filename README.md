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
|Column|Type|Options|

| name                 | string | null: false              |
| email                | string | null: false, unique: true|
| profile              | text   | null: false              |
| encrypted_password   | string | null: false              |
| date_of_birth        | string | null: false              |
| shipping_information | text   | null: false              |

* has_one :shipping_information


| 出品者  | text   | null: false              |
| カテゴリー      | text   | null: false, unique: true|
| 商品の状態 | text   | null: false              |
|配送料の負担
|発送元の地域


## Association

* has_many :product_information
* has_one :purchase record
* has_one :shipping_information





（ここに追記していく）