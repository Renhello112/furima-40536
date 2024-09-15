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
| password           | text   | null: false               |
| profile_image      | string | null: false               |
| address            | string | null: false               |
| phone_number       | text   | null: false               |
| registration_date  | string | null: false               |
| rating             | string | null: false               |

has_many :products
has_many :orders

product
| id            | string   | null: false               |
| seller_id     | string   | null: false, unique: true |
| name          | string   | null: false               |
| description   | text     | null: false               |
| price         | string   | null: false               |
| category_id   | string   | null: false               |
| condition     | text     | null: false               |
| image_urls    | string   | null: false               |
| stock         | string   | null: false               |
| created_at    | string   | null: false               |
| status        | text     | null: false               |


## Association

* belongs_to :user
* belongs_to :category_id

Order
| id              | string  | null: false               |
| buyer_id        | string  | null: false, unique: true |
| product_id      | string  | null: false, unique: true |
| quantity        | text    | null: false               |
| total_price     | string  | null: false               |
| order_date      | string  | null: false               |
| shipping_status | string  | null: false               |
| payment_status  | string  | null: false               |

* has_many :user

Category
| id                 | string  | null: false |
| name               | string  | null: false |
| parent_category_id | string  | null: false |

- belongs_to :product

Payment
| id                 | string | null: false               |
| order_id           | string | null: false, unique: true |
| payment_method     | string | null: false               |
| payment_date       | string | null: false               |
| amount             | string | null: false               |
| status             | string | null: false               |
 
（ここに追記していく）