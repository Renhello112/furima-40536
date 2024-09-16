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
user

| name               | string | null: false, unique: true | 
| email              | string | null: false, unique: true |
| encrypted_password | text   | null: false               |


has_many :products
has_many :orders

product
| id            | string   | null: false               |
| seller_id     | string   | null: false, unique: true |
| name          | string   | null: false               |
| description   | text     | null: false               |
| price         | integer  | null: false               |
| category_id   | string   | null: false               |
| condition     | text     | null: false               |
| stock         | integer  | null: false               |
| status        | integer  | null: false               |


## Association

* belongs_to :user
* belongs_to :category_id

Order
| buyer_id        | references  | null: false, unique: true |
| product_id      | references  | null: false, unique: true |

* has_many :user

Category
| id                 | string  | null: false |
| name               | string  | null: false |
| parent_category_id | string  | null: false |

- belongs_to :product


 
（ここに追記していく）