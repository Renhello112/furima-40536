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

| name               | string  | null: false, unique: true | 
| email              | string  | null: false, unique: true |
| encrypted_password | text    | null: false               |
| birth_date         | integer | null: false               |


has_many :products
has_many :orders

product
| id               | string       | null: false               |
| seller           | references   | null: false, unique: true |
| name             | string       | null: false               |
| description      | integer      | null: false               |
| price            | integer      | null: false               |
| category_id      | string       | null: false               |
| charge           | string       | null: false               |
| delivery_region  | string       | null: false               |
| condition_id     | string       | null: false               |
| favorite         | string       | null: false               |
| report           | string       | null: false               |
| comment          | text         | null: false               |
| status_id        | integer      | null: false               |
| Shipping days_id | integer      |  null: false              |
| stock            | integer      | null: false               |

## Association

* belongs_to :user
* belongs_to :category_id

Order
| buyer           | references  | null: false, unique: true |
| product         | references  | null: false, unique: true |

* belongs_to :user

Category
| id                 | string      | null: false |
| name               | string      | null: false |
| parent_category    | references  | null: false |

- belongs_to :product

address
| address_id     | string      | null: false |
| user           | references  | null: false |
| recipient_name | string      | null: false |
| prefecture     | string      | null: false |

has_one :user
 
（ここに追記していく）