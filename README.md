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
| id            | string       | null: false               |
| seller_id     | references   | null: false, unique: true |
| name          | string       | null: false               |
| description   | text         | null: false               |
| price         | integer      | null: false               |
| category_id   | string       | null: false               |
| condition     | text         | null: false               |
| stock         | integer      | null: false               |
| status        | integer      | null: false               |


## Association

* belongs_to :user
* belongs_to :category_id

Order
| buyer_id        | references  | null: false, unique: true |
| product_id      | references  | null: false, unique: true |

* belongs_to :user

Category
| id                 | string      | null: false |
| name               | string      | null: false |
| parent_category_id | references  | null: false |

- belongs_to :product

address
| address_id     | string      | null: false |
| user_id        | references  | null: false |
| recipient_name | string      | null: false |
| postal_code    | VARCHAR(20) | null: false |
| prefecture     | string      | null: false |
| city           | string      | null: false |
| address_line1  | string      | null: false |
| address_line2  | stirng      | null: false |

has_one :user
 
（ここに追記していく）