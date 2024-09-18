# README

|Column|Type|Options|

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| given_name         | string              | null: false               |
| birth_date         | date                | null: false               |
| given_name_reading | string              | null: false               |
| first_name_reading | string              | null: false               |


has_many :products
has_many :orders

## products table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| name               | string              | null: false                    |
| description        | text                | null: false                    |
| price_id           | integer             | null: false                    |
| category_id        | integer             | null: false                    |
| charge_id          | integer             | null: false                    |
| delivery_region_id | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| shipping_days_id   | integer             | null: false                    |


## Association

* belongs_to :user
* has_one :order
* has_one :address

## order table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :product


## address table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| postcode           | string              | null: false               |
| prefectures        | integer             | null: false               |
| city               | string              | null: false               |
| street_address     | string              | null: false               |
| building_name      | string              |                           |
| phone_number       | string              | null: false               |


### Association

- belongs_to :order
 
（ここに追記していく）